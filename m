Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W8n+jLe/"
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CEEB9;
	Wed, 13 Dec 2023 23:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FZaOAO5vmABT0i97bp/ZMibUxD398U4/Yahe2hBKgzU=; b=W8n+jLe/I0E2TDYrMLqrBgsuqL
	62NNBe7JtDtRBDwETRGttWq8l+UCTtbI/AGYcEqPN61UpWs+ihrwRWLpGa96hnYlkrMDjNynPE9bb
	2l+zjow865xzGyC1+vbEZZhJjArWX6zHprnskaa9VIFc//MlTZH2tW7SyOKZZ+hTVdnKXzpKFDNIO
	qnf7h+LTmN2UPGIOOrZTXZjn43bsLCT9r/1IEqrhqBpFvxAB92bdVDhwNTgvP5WWIfZ3t2OFKdILC
	seuw6NA9eQbR9xkuDm7fHXPhVpS1qfr7QpLTZB3mYP8QBmq98Gs2/Yofyt6WOhUXKVSEqCaIqb5lo
	rCFc2/HQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rDfjM-00H3K5-2k;
	Thu, 14 Dec 2023 07:02:00 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab@s-opensource.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] scripts/kernel-doc: restore warning for Excess struct/union
Date: Wed, 13 Dec 2023 23:02:00 -0800
Message-ID: <20231214070200.24405-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The warning for Excess struct or union member description was
removed when the $nested parameter of check_sections() was removed.
This causes some kernel-doc notation warnings to be missed.

Recently the kernel test robot somehow reported an Excess member. The
code in kernel-doc has not issued that warning since kernel v4.16, so I
don't know how the robot did it. (See the Link for the report.)

  drivers/net/wireless/intel/iwlwifi/fw/dbg.c:86: warning: Excess struct/union/enum/typedef member 'trans_len' description in 'iwl_fw_dump_ptrs'

I patched that warning away even though I could not reproduce the
warning from kernel-doc. The warning should be issued for extraneous
struct member or union member description, so restore it.

Fixes: 1081de2d2f91 ("scripts: kernel-doc: get rid of $nested parameter")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/202312060810.QT9zourt-lkp@intel.com/
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 scripts/kernel-doc |    7 +++++++
 1 file changed, 7 insertions(+)

diff -- a/scripts/kernel-doc b/scripts/kernel-doc
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1659,6 +1659,13 @@ sub check_sections($$$$$) {
 					"'$sects[$sx]' " .
 					"description in '$decl_name'\n");
 			}
+			elsif (($decl_type eq "struct") or
+		       	       ($decl_type eq "union")) {
+				emit_warning("${file}:$.",
+					"Excess $decl_type member " .
+					"'$sects[$sx]' " .
+					"description in '$decl_name'\n");
+			}
 		}
 	}
 }
