Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF399C77B75
	for <linux-doc@archiver.kernel.org>; Tue,  9 May 2023 01:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjEIBbe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 May 2023 21:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjEIBbb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 May 2023 21:31:31 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2092FB1
        for <linux-doc@vger.kernel.org>; Mon,  8 May 2023 18:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1683595888;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:resent-to:
         resent-from:resent-message-id:in-reply-to:in-reply-to:  references:references;
        bh=uStzLe1tmofW57614nQAyaAY3eSlDqWR3vQxVmQVS1Y=;
        b=uK1xa14xrxWfhUHj1QxbjFKz6sYTPR+ZQ9kQ0ghz1PXr5Eixzh9NiVejydTK4CX+x31hoI
        vEZC/XMAzzKunacW4GyqnX3kwVHtScvOjwb9MAQCceE750g8mW2txBmpvsravjly4qS4/M
        TaVoFXZXpcqxLKsnqjO9GcD4pNOegazuuiuUnzOIt3f/Jzhprzd57Hv5/CsiUZ4K75PEwb
        x0zZU5L5BtssABnoLjOQv1BCqirzZ2VwXYoAiPHicJ9G+MsSscRIrR5wmWdEWljw+MyBSm
        11hZWr+29o0cp526k7oIA0qt/S4FU46OErLbTD0YXLBtEEfh5KyxCT13oj29/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1683595888;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:resent-to:
         resent-from:resent-message-id:in-reply-to:in-reply-to:  references:references;
        bh=uStzLe1tmofW57614nQAyaAY3eSlDqWR3vQxVmQVS1Y=;
        b=UigcTYKgRstAkJ11h0wqdrHceYnE7eqpDPKF7rxsrj4bISs7z3FLaCJ05kzvyCzWNkWg9H
        YFMvlN/W1DGxzKDA==
From:   "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1683595598;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uStzLe1tmofW57614nQAyaAY3eSlDqWR3vQxVmQVS1Y=;
        b=xWNjFDl1s1ucegfBKQoncawd3d6If9tExr6i3v7IB0erVNUwt3jWQ6xpT9t2axmBV47Egz
        Qzzf/6eG0TQWoOSYHLyK98dgGPoWq8ZPdbKnLBF+bFMDkBIgUD80KfV3P4fHDLcVFEmJ1Q
        HKAZoci+2bpbtZ1iv9kQZ1koL34GE6y4AbhhEK5SRuKp1S60+KjRB4v/8MHrfVlyzt/aOm
        ewEZc6123SiU/pGCMhBFSqfDRsFxyVECyL0IWFbGbVRWNXoAghfj67OM2jzDVwAQAmoiQ0
        hUyDmEWmdirizxsc1O1FFxo+AItwBn1ssPhe+phW2iue7vCxNDt/PUrrF1BIfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1683595598;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uStzLe1tmofW57614nQAyaAY3eSlDqWR3vQxVmQVS1Y=;
        b=WJiot4UYEtS47knJadY85GFMDZjw4ZAVKGi64k8JHj3oZMySdSuYS/Vb8RZso5Gw1ThPCM
        4eHRjiXqk7nTejDw==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        "Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v2 1/2] scripts/tags.sh: Resolve gtags empty index generation
Date:   Tue,  9 May 2023 03:26:15 +0200
Message-Id: <20230509012616.81579-2-darwi@linutronix.de>
In-Reply-To: <20230509012616.81579-1-darwi@linutronix.de>
References: <20230504201833.202494-1-darwi@linutronix.de>
 <20230509012616.81579-1-darwi@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

gtags considers any file outside of its current working directory
"outside the source tree" and refuses to index it. For O= kernel builds,
or when "make" is invoked from a directory other then the kernel source
tree, gtags ignores the entire kernel source and generates an empty
index.

Force-set gtags current working directory to the kernel source tree.

Due to commit 9da0763bdd82 ("kbuild: Use relative path when building in
a subdir of the source tree"), if the kernel build is done in a
sub-directory of the kernel source tree, the kernel Makefile will set
the kernel's $srctree to ".." for shorter compile-time and run-time
warnings. Consequently, the list of files to be indexed will be in the
"../*" form, rendering all such paths invalid once gtags switches to the
kernel source tree as its current working directory.

If gtags indexing is requested and the build directory is not the kernel
source tree, index all files in absolute-path form.

Note, indexing in absolute-path form will not affect the generated
index, as paths in gtags indices are always relative to the gtags "root
directory" (as evidenced by "gtags --dump").

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Cc: <stable@vger.kernel.org>
---
 scripts/tags.sh | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index ea31640b2671..3de4b4ebd891 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -32,6 +32,14 @@ else
 	tree=${srctree}/
 fi
 
+
+# gtags(1) refuses to index any file outside of its current working dir.
+# If gtags indexing is requested and the build output directory is not
+# the kernel source tree, index all files in absolute-path form.
+if [ "$1" = "gtags" -a -n "${tree}" ]; then
+	tree=$(realpath $tree)/
+fi
+
 # Detect if ALLSOURCE_ARCHS is set. If not, we assume SRCARCH
 if [ "${ALLSOURCE_ARCHS}" = "" ]; then
 	ALLSOURCE_ARCHS=${SRCARCH}
@@ -131,7 +139,11 @@ docscope()
 
 dogtags()
 {
-	all_target_sources | gtags -i -f -
+	local gtagsoutdir="${PWD}"
+	local gtagsroot="${tree}"
+
+	[ -z "${gtagsroot}" ] && gtagsroot="."
+	all_target_sources | gtags -i -C $gtagsroot -f - $gtagsoutdir
 }
 
 # Basic regular expressions with an optional /kind-spec/ for ctags and
-- 
2.40.0

