package org.intellij.sdk.language.psi;

import com.intellij.psi.tree.TokenSet;
import org.intellij.sdk.language.psi.SppTypes;


public interface SppTokenSets {
    TokenSet IDENTIFIERS = TokenSet.create(SppTypes.IDENTIFIER);
    TokenSet STRING_LITERALS = TokenSet.create(SppTypes.LITERAL_STRING);
    TokenSet KEYWORDS = TokenSet.create(
            SppTypes.KW_AS, SppTypes.KW_CLS, SppTypes.KW_ASYNC, SppTypes.KW_ELSE, SppTypes.KW_FALSE, SppTypes.KW_FUN,
            SppTypes.KW_IF, SppTypes.KW_IS, SppTypes.KW_LET, SppTypes.KW_MOD, SppTypes.KW_ON, SppTypes.KW_RET,
            SppTypes.KW_SELF, SppTypes.KW_SELF_TYPE, SppTypes.KW_SUP, SppTypes.KW_TRUE, SppTypes.KW_USE, SppTypes.KW_WHERE,
            SppTypes.KW_WHILE, SppTypes.KW_WITH, SppTypes.KW_YIELD, SppTypes.KW_MUT);
}
