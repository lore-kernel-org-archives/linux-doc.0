Received: from sonic313-47.consmr.mail.gq1.yahoo.com (sonic313-47.consmr.mail.gq1.yahoo.com [98.137.65.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E86E566
	for <linux-doc@vger.kernel.org>; Tue,  9 Apr 2024 20:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.65.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712693114; cv=none; b=NoCyIAN/0GA0nhoQgifp7cLCczubBWTjZZcfz2NPZQ6cTP21AZMmwCUdS0ojcaMZDTygAuAFgsYkBB+DXh4V5IEMGSRimPDI/EZUtUF6dYknDDd+xwZE13lyYHYM8K5Wx1ggmlTpMgEXfE+NRoIQlLuGh6jn5Cm1LReUCNTYMwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712693114; c=relaxed/simple;
	bh=a8ddZuehFg84N+6V98u1My4a2+ltnFQLXir6FRaBgSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:References; b=ecZdGaxfKmNqhLySi+H4BqE3FsdLBPdPL5WfVYRT77EL24cFUk/g/T/t7H2oHBphZ/h1VExKsxooHh1npSPJ8184IbY9f6bCPwnSr2GJMszNrvp0VVU6X9iR3cgL/hUtW0vS0DI+5hIFDHyDCR4aOtUIvydABUltR4uQJQfQHzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.co.uk; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=ZMpA+yfb; arc=none smtp.client-ip=98.137.65.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="ZMpA+yfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1712693112; bh=pVMCX21u0wBc9yldyEKLn3Oo8MQzZsaUhaZmg/so+oY=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=ZMpA+yfbAIa4IPtBxYOrUnCKYTWG3fqNVxMdikauZnNh58TclMFqKfImSNUi6uec4CYPiK6iiIlx3HcaHlWJwcpd3Ed9XvFBvjrazS2RQMv61JnMZybJP4/BXET5/p9p6kxXlsO7PDCcpsq3/RACWSnOOyTZYbYcvv3rx1CTzIfNVD20xRlb420DOT1ChhINBH1VCmDr0KQXFcOcLGrvEF+LAQ4mrujKMiEURVHRsSN5UVwYG5Q8m21OEXY9MvDq4K9Xb7I3F4JcBHtiYSps2r6421XfND5cqPHKO8zOYydHdP4VPsamkGcXdD/QYOEKDUXj7tE5/57Ac0yqYSSVJA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712693112; bh=gt29ghoDZvbTE/R7JYG6TkhxPeFgwGN5LOBLAYMIGNu=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Cq1E3HzLJ8LE228BB/a5jyTcuzRxMKMfuPluiry1hErWe8ykYkdne67UUqMP24eN3pqdNnLock0rZ1N+v1/skkYZhkV9K95Kp5UvHiZGs64ltJUJ0ungrCuoYfeQrwijFubqwhIR4KhgGZemPHIwInnu1lIZyjuSIhwjj8HiVMmI0nUz3xoo/R2mXKK7LelM4SoGfZoOITZRVstcmjo7rZZoybdNbNojgw9MhQ6XxhmYadyTbNGb24jrkJUT65Vfsz4EisgGDZhZ2nvfDkI5HwPiY/BsvWGjJqf5i7b/j76Qdeqnl4BzAME4wGNzeEC5GBbCCZJ5jfIV+NGEzijsTA==
X-YMail-OSG: H8HCUMUVM1noYKYq9pam_9mAHVCFEQ0kfI0TQFRy1CVEGVr4g8aCR.vOpDggtW.
 1CtD3qRtSRmDYxZ_5RL1rE6W8z.6AqeLoUp6PxfBH2WcXDrynxwLa9DsKB62xrGjWWiUj9oU..0l
 8wW.q7HRey7KCRh6AbzCRGOY3ECnYFp0rGrzzLQW_SMfs57zCP5S.rqTeZ3ptJHiPNEXpnked5BR
 .u6RHpMyMetA45iiKXDUReY2zkUOXYQXVpYkWDBZ2dqwlDSslXqCyrJ.j9JPpknFabt5U0APXjiN
 pZWMm_zSD9tsLkPblF71rk5QPbNyN5BrB0HB1tfQLlg5C2Dte0bgJH2UVleA5PHeVoiIhixyeWv1
 Mni3kF8TL_KhDQiuj.W0hJfH9hJx4xMq6.7iucVmQWSncecOjqhW.wSi0kv_OYOzEeky9pcoEy1U
 usS2kbQ15OeIrOna_bs6gt0bmxp61wU8OkZI2W.tmw6k5YCU6IQ6jOPqrgPc0pmE1G1t4WVwn0qq
 Dy0AQHg7QaJaqtpMrQca7FXPx_cbekUBdzJuHmC.U8TYd9fKy1PMam6WNmrlyrg.LhxlEppdlPnv
 5gnVoaS65FCKghCMtSpTfaWqoQv.xUHFNKX8XL_QVd.Z_hZAabJ19PkObSNBWMn9lM2qWp.A4w0I
 0EPdgxZQA2RoS0e.GVu_FizQcQiTtT6VrKguTxjDPD7E.6psZL5Dm.1L6wzVE1HChrNSWvLY_4Jy
 rZ25JGl9qRrPBBLNld8.71JV8pKmC1AoME1CcDM145e1EwGEeFSyLTjKRgtitvQKcuWyp_xH6amB
 FVUofWLZ_8nmOWu2QVNq_nSqKKsxuhp3c7zxQ8i_90oCR.MVszfARK65IYqbvGGEAX.zUGpYNzRo
 vV4WeU9H20xuPwGiQWv9A_G5LOMsYK7rxJGcHWDKlbzl5wFMrFxUbIfERk4M3haX6j9aj656sqt5
 nNk4R2pMIIBuAfPNdMaUf9q9X_PeWnLSDCZuik5yFFCAPA_bb1qcsYxRPbtKiwFynPW2FqO3XCEI
 jHJ5EMDYtYiOMnEKZspuCj6iKSXR8PV0EDNB32GzcHWCfZZQG87JVND1CEfUJ_K2ooWQmtLwcy3u
 WxuLyla3b1jtt3cLrUohp3Ek5y0oOFhd8c__2WtikLDQ8bFoRT_CmDT39suACkkVzsAMZQ5jCQfh
 QzURodjD8sC0lDYHefiGNaoiy1e5_c_4EHuq6ab_I7JRuNkbEYyVTiRfSqnHMgEB6B4znhLyQ_Wr
 GVKLYl4zt.gUdULEIlcG3IodfghiyDfUvjypHOfXfvCRfFIwkOycdK3wV2Kbl9mpClrZYdgs_w.z
 Eb_pf30KB6d2xzFLmSZyl8jwtqHaJxlaJ8UnRsSBtviIZgZqyqy97wFHmCAmAdC4Fcslh35Zf5ee
 JXOYmtw0FOkP_7rohmU79RWmdFrJPy8GFhc1YZcRM4Qgbh76rlbFAt6olSVmKBEPBUMknF5m7z2F
 sg88h09sikiS.sdtyXtBn9Ng7_ljnn_W0FOwx4bcBrt2_grlfo_FRdI_ug340xWoYJh5.aw7OEWp
 6VE5lVVN2BUgRAjwigCfnYz0k0n1vlbRVVZgpGqnfgWBLByoYgKQW82ca_l5TYx2gtWowIIa7VtS
 khzF554apq2d8UkieG._o9Ivk0th2cKxM7dx1xq7lsZMiDwl_KhGbFHUCkibToamd7y2lmJr74pr
 90rsXJOi_iP.DNTZeWXKGpmANtmhKbdaXlehb4kDlH9YDNtcQIcpIUik9N8vaYtgJbeUoB.LnGq4
 co2OXu_a6wraMKFidSY6aMyzyKzCh2In2GalfZqQPqFJDEfdZV5AXnSn4dxng9m.cpmzHZEo2FAd
 ox6_4yRGzCrKEbo.A3.IWdMaCkBB3XseD3f4bz4DOgrF2fo8ipVpqI60uWOWupMY45RKu6nNnDne
 wMe3M4gnRtx9QAVP9KWBUl8NY_D2l8GieyLLR7M.swht9flwChw5KcI9ON.NdDqXiKJjoZdnWYsb
 dee9HAsxH1iyrZX5Kpy35L7I3qWk2xCMCgTO_b_J19GsNbNIYAngZQGfKAh5N1pl1.cIYfnW7yHZ
 vGAyyz81jfUZpgTgVkzVgkpW9yR8X3vqh4JK8r3iIB3q6FM.7zVIXj536KSc3FHsjdWZu_KbV96s
 DCHZ2zaWM0PqZ2K5bgTYNDVYBGRXx7EFydLQvTCP_2s_kSkC_TlDPpPX5xSMs67Rk_cWiNsviDTg
 cdVWwYJq95.FjS8nk6Xue779eoiZCqoHm9NDZHcLCXS7UkixDSH08nD2P
X-Sonic-MF: <rubenru09@aol.co.uk>
X-Sonic-ID: adb324b8-0163-488d-a0b9-d8a02d971dbf
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.gq1.yahoo.com with HTTP; Tue, 9 Apr 2024 20:05:12 +0000
Received: by hermes--production-bf1-7d6dbd57c9-rgkn7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID ce6b28aff7bdb6bbe07e2f9d9b252da5;
          Tue, 09 Apr 2024 19:53:02 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] drm/dp_mst: Remove unnecessary vcpi documentation
Date: Tue,  9 Apr 2024 20:51:30 +0100
Message-Id: <20240409195130.25057-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20240409195130.25057-1-rubenru09.ref@aol.com>

Since vcpi has been moved into the atomic payload and
out of the port struct, the documentation of vcpi on
the port struct is no longer necessary, and is flagged
as a warning by make htmldocs

Vcpi is also documented elsewhere in this file, in the
atomic payload struct itself

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 include/drm/display/drm_dp_mst_helper.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 9b19d8bd520a..3ae88a383a41 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -83,7 +83,6 @@ struct drm_dp_mst_branch;
  * @passthrough_aux: parent aux to which DSC pass-through requests should be
  * sent, only set if DSC pass-through is possible.
  * @parent: branch device parent of this port
- * @vcpi: Virtual Channel Payload info for this port.
  * @connector: DRM connector this port is connected to. Protected by
  * &drm_dp_mst_topology_mgr.base.lock.
  * @mgr: topology manager this port lives under.
-- 
2.40.1

