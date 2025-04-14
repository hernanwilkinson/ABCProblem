import java.util.ArrayList;
import java.util.List;

class LetterBlockPlayer {
    private String word;
    private List<String> originalBlocks;
    private ArrayList<String> currentBlocks;

    static boolean canWrite(String word, List<String> blocks) {
        return new LetterBlockPlayer(word, blocks).canWrite();
    }

    public LetterBlockPlayer(String word, List<String> originalBlocks) {
        // I do the uppercase to word and blocks in the canWrite to avoid loosing
        // how I was configured - Hernan
        this.word = word;
        this.originalBlocks = originalBlocks;
    }

    public boolean canWrite() {
        initializeCurrentBlocks();

        return word
                .toUpperCase()
                .chars()
                .allMatch(letter -> canWriteLetter(letter));
    }

    private void initializeCurrentBlocks() {
        currentBlocks = new ArrayList<>(originalBlocks.stream()
                .map(block -> block.toUpperCase())
                .toList());
    }

    private boolean canWriteLetter(int letter) {
        return currentBlocks.stream()
                .filter(block -> block.indexOf(letter) != -1)
                .findFirst()
                .map(foundBlock -> removeBlock(foundBlock))
                .orElse(false);
    }

    private boolean removeBlock(String foundBlock) {
        return currentBlocks.remove(foundBlock);
    }
}
