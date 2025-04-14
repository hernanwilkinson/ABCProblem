import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class ABCProblemTest {
    @Test
    public void cannotWriteAWordWithNoBlocks() {
        assertFalse(canWrite("A", Arrays.asList()));
    }

    @Test
    public void canWriteAOneLetterWordWithAMatchingBlock() {
        assertTrue(canWrite("A", Arrays.asList("AB")));
    }

    @Test
    public void canWriteAManyLetterWordWithMatchingBlocks() {
        assertTrue(canWrite("AC", Arrays.asList("AB","CD")));
    }

    @Test
    public void useOneBlockPerLetter() {
        assertFalse(canWrite("AB", Arrays.asList("AB")));
    }

    @Test
    public void wordsAreCaseInsensitive() {
        assertTrue(canWrite("a", Arrays.asList("AB")));
    }

    @Test
    public void blocksAreCaseInsensitive() {
        assertTrue(canWrite("A", Arrays.asList("ab")));
    }

    @Test
    public void problemExampleWorks() {
        final List<String> blocks = Arrays.asList("BO",
                "XK",
                "DQ",
                "CP",
                "NA",
                "GT",
                "RE",
                "TG",
                "QD",
                "FS",
                "JW",
                "HU",
                "VI",
                "AN",
                "OB",
                "ER",
                "FS",
                "LY",
                "PC",
                "ZM");
        assertTrue(canWrite("A", blocks));
        assertTrue(canWrite("BARK", blocks));
        assertFalse(canWrite("BOOK", blocks));
        assertTrue(canWrite("TREAT", blocks));
        assertFalse(canWrite("COMMON", blocks));
        assertTrue(canWrite("SQUAD", blocks));
        assertTrue(canWrite("CONFUSE", blocks));
    }

    private boolean canWrite(String word, List<String> blocks) {
        return LetterBlockPlayer.canWrite(word, blocks);
    }
}