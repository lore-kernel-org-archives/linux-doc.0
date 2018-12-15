Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 643B77D089
	for <lwn-linux-doc@archive.lwn.net>; Sat, 15 Dec 2018 17:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbeLORx1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 15 Dec 2018 12:53:27 -0500
Received: from smtprelay0108.hostedemail.com ([216.40.44.108]:37583 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726641AbeLORx0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 Dec 2018 12:53:26 -0500
X-Greylist: delayed 503 seconds by postgrey-1.27 at vger.kernel.org; Sat, 15 Dec 2018 12:53:26 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id F38BD80051B0
        for <linux-doc@vger.kernel.org>; Sat, 15 Dec 2018 17:45:04 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 52FDF40E8;
        Sat, 15 Dec 2018 17:45:03 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: lock08_833657f341953
X-Filterd-Recvd-Size: 2657
Received: from XPS-9350.home (unknown [47.151.153.53])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Sat, 15 Dec 2018 17:45:01 +0000 (UTC)
Message-ID: <9d20d06ea2b92e6b66f0a2dc58f8b191fd7778ce.camel@perches.com>
Subject: Re: [PATCH 2/2] checkpatch: add Co-developed-by to signature tags
From:   Joe Perches <joe@perches.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     gregkh@linuxfoundation.org, himanshujha199640@gmail.com,
        apw@canonical.com, linux-kernel@vger.kernel.org,
        niklas.cassel@linaro.org, corbet@lwn.net, linux-doc@vger.kernel.org
Date:   Sat, 15 Dec 2018 09:45:00 -0800
In-Reply-To: <20181214121634.1157f2302c8ba1825fc03ad2@linux-foundation.org>
References: <1544808928-20002-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
         <1544808928-20002-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
         <20181214121634.1157f2302c8ba1825fc03ad2@linux-foundation.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2018-12-14 at 12:16 -0800, Andrew Morton wrote:
> On Fri, 14 Dec 2018 18:35:28 +0100 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:
> 
> > As per Documentation/process/submitting-patches, Co-developed-by is a
> > valid signature.
> > 
> 
> I'm with Joe - I find this tag kinda useless and duplicative.  But whatever.
> 
> But as the documentation says, Co-developed-by must be accompanied by a
> Signed-off-by:.  It would be helpful if checkpatch were to detect a
> failure to do this.

perhaps
---
 scripts/checkpatch.pl | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 93e84c9504a1..056d4b47ffaf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2673,7 +2673,20 @@ sub process {
 				WARN("BAD_SIGN_OFF",
 				     "Duplicate signature\n" . $herecurr);
 			} else {
-				$signatures{$sig_nospace} = 1;
+				$signatures{$sig_nospace} = $herecurr;
+			}
+		}
+
+# Check for "Co-developed-by:" uses without equivalent "Signed-off-by:"
+# $signatures keys are all lower case without spaces
+		if ($rawline =~ /^---$/) {
+			foreach my $sig (keys %signatures) {
+				next if ($sig !~ /^co-developed-by:(.*)/);
+				my $signer = $1;
+				if (!defined $signatures{"signed-off-by:$signer"}) {
+					WARN("CODEVELOPED_WITHOUT_SIGNOFF",
+					     "Co-developed-by: used without Signed-off-by: by same person\n" . $signatures{$sig});
+				}
 			}
 		}
 

