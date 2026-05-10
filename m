Received: from sonic306-20.consmr.mail.ir2.yahoo.com (sonic306-20.consmr.mail.ir2.yahoo.com [77.238.176.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF0378D7D
	for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425486; cv=none; b=fHdnooZuDXxtU0DDHa3vXYacvqBXmzPoQl1EJDEHAnCvupHt7CQA7/+LPUKPeRCmP1+233fJSzQjMpYcxJTt2JbMpoylPPu7w5Ta++ugBlIoCAG6Qp4wcr6Nnh8LUchjHfixvCHfPa/R+67p4t+Uxz1hVUCA+22ETk5ym/82CyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425486; c=relaxed/simple;
	bh=k4vrdSdqTYKtlpA2IBcDPZn6DPODy3ZPA/tWBDDOKsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=GttSwREWwU1IPonwq3Fpvt7IssZU+E/ZiE4nupPmm88DwDlfPWaTyFAjgHMjhTVfMvtGb0MIXB3iR2oziPzPF6JkFyz7YK3wngQs46sg6fdS7E5cvIHOmFIyufYK46JPAtf99K7DOuZIv1dmBWj2qU5EaoUs7tDiSj2DKPd13uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=sF9P+sMz; arc=none smtp.client-ip=77.238.176.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="sF9P+sMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1778425482; bh=yhzNK1MxXhWyKER6B16J+oTKxIWa+vvZ+vg1sOhzKfc=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=sF9P+sMzDYI+gHCb6fD85kdHOLsAv0EVmLPfdFJowALy0B1FCjmzP3lG95Md0gm32H43ZooQ4+syK1paNRhznC6VQtgDKkGy0s58jAY1LAt3A1Lawftcs9NpsdSl2XDHgRVeEE0CvLpI2SkJk0T8RxoBiDiqgOLOPm2OW93vupbjfWxLjREFCJPWCcof+Y9r6BqBGH/+dQA9uqeJ78lDQw/298hniz0aEhAPRZwyRHmdhPxtYh7F1cCM7aX0ky1zAfIhUYxXebg+QJ3+T7N7BFGg9q9SaQb+Yzrh+xYtVM+iEv87amBd3LA+O8v/5hEk7qYpmfSkY5/jedR7CCLHfA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1778425482; bh=3mopf3wkLalCyx7ODJTrv+ZbqtoVSK8FrldMU7dInuf=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=gtBFWYvMcLxwZh9kiEsEHl7SinAHRNwUdUs0jyDUcrTJRkYcgn6xwUAxoPU8LNBEv64B1O0DFvZ8u3Fry0UyBwVchyvV+4SJAaZxqeF2zgl/etRfZPUslK4afaXvn9cQns2sGSVRXg1kf3iyyUvNZFxIVhPkaIGH0QMWJNsro82gY6lnjHQf8CUNf/k82/2ZeeEB/AgKTaB6OlCjZpNZr2JgGWsqCx7wtLN7zTc2LpDN5bO1pvEWXdDg3f/ol+S03VUl18watV06n3+mg3g8Tc47YPqAxWfqCR2Kq/WtbV0n6PkUiFeBjYP9e79DMPFO08tLWYBVgq601JbaJ61new==
X-YMail-OSG: LlHhvqEVM1lNCZ.JIjqOcpjJTUU04M6yKmfO34BA7SBoIjFfDrNQB65qDBeum70
 BbD.NcuEZi0xCHWZt9bkYFwfrYPfJRTiCWnXx78rL.nMskrfaDY7ri3lT560GB5CV8FDmzLIele9
 ta_yB2GN3Enwy7YPvDVQWqCGESoJHaA4diwL305SJ.GOqV1XGCoi7quZvI6UD0PNWlrPd.U4JG8c
 1lxdM35gd3Vfdi_nABvrqZh3OdSJRHQbe_FPXDZejzYfIB0gCN5Hfaahy7deY_RcvX3uc8O6btm9
 k0mx65QZW7cZUouqCplU11zx_rM79MXF3jGFmarmKsrhtH5RqcW9xEtdaxnjObLRiWInBYlFVuHF
 d6LbzqhBfKYzz9uwr.wiBIUq2c.lPcXLB59uv08eNe4cJp55aLu0rzQbhvsacdtBIb7OGVxlkM1D
 Rwz0KlTFV.FoixyN2KnphB1giN444rteBvm4oFZLy164r0XrC3OJttfi_XhxNzPucANPOtudzZEQ
 HdYXQTu0pClmjxkH2OJBUwLlSRzrq1KmrZQJldu8Z2CzovMGJyDSWcj4e9Tuag_KeFyrHKaEHH5V
 XHKey71F1rq6.dWy1gbp7Wsksd1NE.4cprkz7inlM8B6Ge1xuxgxEd62wjvULmvi2eKmGOPTrH0.
 KT5MrH1pcjRB7NGTzseOFuA6Gma86C.U2ALDiffFeZCBqf6hbGDJQyro8MrvgCCBaTsiR.uUl80n
 8H6zRNwtTYLbsbiERnWMcJ5MWlypMC6duSx5LadLmp53kiaX5CnZjJnPd_s_c5fMWnd6_hrSP39x
 rVR.9zTAqIa4PnrjPNcx_FQUaw.38goJsBMU9n.pVvp0XxFD4kRW9fG0nPpMDk9zvveow0rnuu6L
 9IyM045Rmsa_6G9MYhc8ayy9I8l8JbZw3bb3yVjhUbGLIk3S72yFcYsjzaBjk51awote69HpBOQT
 CwmxFf2AZFSFPVHW3wXkjs7WaA1Yho3E5ooOc6dNeZSICpMd9iOdc2Ev8QHHwE7Odqoh9dU4RH7q
 Q51NblRVzTIq.qcHOCywrUFWnOG6hezFouJ2PhI7U6SVksOPP9fhvCrUrjxRpB9qdgZ4AK39XohV
 vV99mLI5Ywx5NgouiqQVZ.yB_S7i8oaa1ir1CiL8Qx8U7S3_t_rabDJCYZR3On2CTY6vM8.Iqn2P
 88bRtAtXGWU3ouIURMBvdW2KSuwXJ_w_OP2x8sXZaUaBdgm.lmxq_TsJExRJzVEdrFfig6PV20I1
 m3klIAJkPhKckzJ1QrGyuNRjKWluB4aE9voqoa0OOYvM0tXVkF1DhJBk_p9ftKtLePayfqw1SwD3
 B8_PGZVZ8Kw2WviwjR1vbu5xK3aEr.RvDe1NVbzeco5TA4q8HiDxYMik3XUiyn_H7H1xUIYrdqmJ
 RqV_KNKwsuaBuxqTgKxgqmkqjoLUGS7mnAJkgfzCtqg0IfDMAVX6RjpbTbEDSOREF1hQ.eZEd8lz
 HvUawYTg7wrFVCNtMrfPR7OwUu74Twm.IFAPG9FvG7TFHx4XpleDJ4OGkBb42rqrm9Y_HNvntWhR
 LcTKPChEB.tphGVoeUQQkOTvnqDP7VOR7DR5CC._h13zUUNXKqkgMIt6ovftmRaaaekEXh1zHNdl
 Ez44Eu.teK9JLGUtYvtsFWuzcNg14TICXNux0tJdJq3uTzNbmjvlNZNUlexUCD.aAQ61_d33nXNV
 _NMuofGj5XdZq3UJwNsyEzEz.bnqL_R.d3bF0Ga0IlPb0NkGutoKIdxbieEoPxjdaB5og7RU4rGw
 x2tSMRYTmfOGYam_tYZLQZY0PaIx8nSrtkcvyfzvHyKoW3RzpHOQqyno5VgMJu3TOjXtTOvuVnrE
 3PugZl0ACuJ2yA1FjlhWJio9uA5N9fedSEbpnVJTTEdQU2tcWJO5bImu7R2uO9amyNAJzs_pncb0
 6rQBFg2A_yO1M_EZi5lt.eqKjGn2Vx8f0Jy.dSbkCJ1vyW1uu.ZPhmUaer2yBOmPw59twdtli3Sc
 IB4zCe_g9PRFcoduIiqaXGLEBnt2yJzGkeXMNxNtAOD_tlY0ZLjJaHCJan6aql6VvY4w_t3e.rPu
 XuGqrLWSMMpmD7QRomEmQRbBIjIjGOPBl_aASNzvvrxJGCGH9ZS9XH_zmtnL_QAdFsVn10fE4oLo
 TKAH1yPuVgp9Ed6676Sh4I4l6bPtTpvgfX525RarQT9liorj43Ar_3GNGVkJVath0.rqWDIJ_GFQ
 fjZSo55fPaL7YEluV4Q4HIVlP1aTXZcIoaKw3VO4YCr2D8N5PPfdSU1dQXxk-
X-Sonic-MF: <nicobsc4@yahoo.com>
X-Sonic-ID: 8edaed84-9363-45fc-8b94-d1167729b603
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ir2.yahoo.com with HTTP; Sun, 10 May 2026 15:04:42 +0000
Received: by hermes--production-ir2-89844b765-82cnf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID ce718115184f3a1163bd756cced3f7a1;
          Sun, 10 May 2026 14:33:20 +0000 (UTC)
From: NicoErdmann <nicobsc4@yahoo.com>
To: linux-pm@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	NicoErdmann <nicobsc4@yahoo.com>
Subject: [PATCH] cpufreq-stats: document limitations on modern cpufreq drivers
Date: Sun, 10 May 2026 16:33:03 +0200
Message-ID: <20260510143303.120863-1-nicobsc4@yahoo.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260510143303.120863-1-nicobsc4.ref@yahoo.com>

Signed-off-by: NicoErdmann <nicobsc4@yahoo.com>
---
 Documentation/cpu-freq/cpufreq-stats.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/cpu-freq/cpufreq-stats.rst b/Documentation/cpu-freq/cpufreq-stats.rst
index 9ad695b1c7db..e8a8b3a85ad8 100644
--- a/Documentation/cpu-freq/cpufreq-stats.rst
+++ b/Documentation/cpu-freq/cpufreq-stats.rst
@@ -28,6 +28,13 @@ Various statistics will form read_only files under this directory.
 This driver is designed to be independent of any particular cpufreq_driver
 that may be running on your CPU. So, it will work with any cpufreq_driver.
 
+.. note::
+	
+   On some modern systems, this interface may not be available or may not
+   expose meaningful statistics depending on the active CPU frequency scaling driver.
+
+   In particular, drivers such as intel_pstate or amd_pstate may use alternative
+   mechanisms for frequency scaling and accounting
 
 2. Statistics Provided (with example)
 =====================================
-- 
2.54.0

