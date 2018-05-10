Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A38037DE74
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 19:38:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751899AbeEJThs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 15:37:48 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39099 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751892AbeEJThp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 15:37:45 -0400
Received: from tanglefoot ([86.19.254.212]) by mrelayeu.kundenserver.de
 (mreue006 [212.227.15.163]) with ESMTPSA (Nemesis) id
 0MTJVi-1eq0bi0Vza-00S7Ap; Thu, 10 May 2018 21:37:40 +0200
Date:   Thu, 10 May 2018 20:37:37 +0100
From:   Justin Skists <justin.skists@juzza.co.uk>
To:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/process/posting: wrap text at 80 cols
Message-ID: <20180510193737.GA19307@tanglefoot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Provags-ID: V03:K1:3FvRLdcNpXSWH9UZVNdWIpV1RDNDcuJSgj7hz2DzSyeeStX+IMj
 xfdXljZ4Rt57xkjapHghhZIgO0Vff4u+kRkxKKPPyCJrJbKia47SyxiQsef7qZ99azKzoMf
 fDlMzWBjRuyOaUGHfbuEalK24ydBBLu5stx7BxaiSftsC3tshOWDyBI3Hkwsras6/njquaN
 w9htQJf0aEuPoYa/MWXuQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:3XTvyzeKjxA=:xS5P+m2AWiwkbF80wEzoK4
 7Fe/TpYc4Lhbglt2vvpFcviBHCAXD4FeVz+2Tb89bdfwzDmKeg3GXR2xJCArvtoXZLdWskPgY
 JgvfiSxEEug5Mqlh/aAc8Q63T9LOaUNZPzx0KYrtlfXNcx/z+fQRgWYgvvQo3YIk93fxL1G29
 JTx7mpSfsihjXA87f5kp224mfk5wLkZx14xU/qIvmchtjUha5+FTIomNHwxBgAKF67w8ff0WY
 yZ72gZqfIk5EV0Hhy8Y2ddc3ONqYFZp3FT3MANYSmhbggm7PWW9NRWZ3Imn8Q3YOIuxE0dmM9
 NNc7/REvui1m20Y/8FOalMjhSa7ezB56DCOqgvIy26FbLvAsFrraaRA+vFijUNXkzLkXGH14t
 xKvI5RmAv1otXtYv+myxOr9dDh5E3ShmPdJS9i6u2VZNF84vAHDjuqhXEvIM0vOSeXH6Q6GvR
 KV8O1/teZOVO7K0SVzT37paOu5sNEN2Sqp53p2kbt9uC51NDXJ9foo/d/HIhATZrT4OFOOPiG
 cTa4Ath0K5Mx86CupZHg/8pHNYiLvAVm1rb431Wp8DhdbvE9Q4uzdT/xqKMXzWX1KhVy4roLv
 fHNqb/+jZBgqKMp30ukkfLjIRxI1/yzVhB+VJu+Z8+S1E2MowwH9dpEgKq3KuukkquiFF6v+6
 4lOlRUR/hF0LrxjtJojFRNfGRhsAqs7Tb9xi3B9t2GCsG4fEBxi9gan40LHjZzJ0M1K8=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Trivial patch to adjust the text formatting to wrap at 80 columns. No
actual content has changed.

Signed-off-by: Justin Skists <justin.skists@juzza.co.uk>
---
 Documentation/process/5.Posting.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index c209d70da66f..c418c5d6cae4 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -10,8 +10,8 @@ of conventions and procedures which are used in the posting of patches;
 following them will make life much easier for everybody involved.  This
 document will attempt to cover these expectations in reasonable detail;
 more information can also be found in the files process/submitting-patches.rst,
-process/submitting-drivers.rst, and process/submit-checklist.rst in the kernel documentation
-directory.
+process/submitting-drivers.rst, and process/submit-checklist.rst in the kernel
+documentation directory.
 
 
 When to post
@@ -198,8 +198,8 @@ pass it to diff with the "-X" option.
 
 The tags mentioned above are used to describe how various developers have
 been associated with the development of this patch.  They are described in
-detail in the process/submitting-patches.rst document; what follows here is a brief
-summary.  Each of these lines has the format:
+detail in the process/submitting-patches.rst document; what follows here is a
+brief summary.  Each of these lines has the format:
 
 ::
 
@@ -210,8 +210,8 @@ The tags in common use are:
  - Signed-off-by: this is a developer's certification that he or she has
    the right to submit the patch for inclusion into the kernel.  It is an
    agreement to the Developer's Certificate of Origin, the full text of
-   which can be found in Documentation/process/submitting-patches.rst.  Code without a
-   proper signoff cannot be merged into the mainline.
+   which can be found in Documentation/process/submitting-patches.rst.  Code
+   without a proper signoff cannot be merged into the mainline.
 
  - Co-developed-by: states that the patch was also created by another developer
    along with the original author.  This is useful at times when multiple
@@ -226,8 +226,8 @@ The tags in common use are:
    it to work.
 
  - Reviewed-by: the named developer has reviewed the patch for correctness;
-   see the reviewer's statement in Documentation/process/submitting-patches.rst for more
-   detail.
+   see the reviewer's statement in Documentation/process/submitting-patches.rst
+   for more detail.
 
  - Reported-by: names a user who reported a problem which is fixed by this
    patch; this tag is used to give credit to the (often underappreciated)
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
