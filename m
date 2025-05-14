Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C0E2701C5
	for <linux-doc@vger.kernel.org>; Wed, 14 May 2025 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219898; cv=none; b=tsGkeh2EQqsCtKY9+j8aXcUDxtJwBWaaUSvpfAEMDV1aRepdcEoI5cA26Cv6LxaGZaQO/UB+FoIAUN+HiuojzTQmblfAbAIVWxRJu1Mz60Oe/QMrHvyCcTuFQGNN3cyRPPx9DMRcqvSaOnTr/XC51hlFbnA5Yo8fktxu7Q9JEbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219898; c=relaxed/simple;
	bh=wLaFSE4Ego8v1EspVmpwZvp7EGmsaYZheUHWIKTDou0=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ZhUdMvnTNjBgT2zM23G8mzB0wwZ39YDt4tQce06X7Nv/AbrqSPmP95ZLxrMdRuSJeD70q557baoymxP5zfnmPjXtohexwyxNly1E6Yiq6/u7M1HV0V+2bqlHhUwf6qGj3uQ2jKHyZlBTd3Mnze7f2Ll5zRoL7IjFYq5O4cF99rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ht6ycDOG; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ht6ycDOG"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7399838db7fso711057b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 14 May 2025 03:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747219896; x=1747824696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cq6p/kPXWwDEOATIHuka8hW4yqkWwDKs7Z4JsTS1wLU=;
        b=ht6ycDOGjW3CoGbN7baK5BT6AEXH3v18v9Raz9LTCFFIvVKNVkh9FtbIbsauAVzG3y
         merefg7QpcwVYfH37UuxRTWo2aHzFknWVhZ031Uz6jbDEVBWM/XHX9xW9JJ9svtxLBiL
         /Jc/SCPKWIKK1EjQVd7Q4YpAXjCvgiUf+cTAW/tOzzAf+elJgLpNWDtB/iZJfNWNmjFh
         VrSsV6SznTnCyDZ9TNIDsW1kiqBt4Sf1ieNv0tgnt5aaDouIVUyO2YTSQudKXDOOy7lN
         MQY7REWkhIvnGZ8sPdRs/mG0LT3ICAn/A4aVSjrBgzjKr1SATnvZH1Fd37M0ZQIlyBJE
         zrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747219896; x=1747824696;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cq6p/kPXWwDEOATIHuka8hW4yqkWwDKs7Z4JsTS1wLU=;
        b=xGsnenqaub+vhB+UpVhZfMjCeIBrSViiKZzLGkIF3HS/MP47otgnrIveL6gbRjuV+x
         zrvlzODCc0CTedMPn5lc6S/8aNQOshbBpETxsAMYLv14EXU7HGNOUYxCler2IJ5QuNy8
         RJOFKVf+q0adCcfo5vlOvPsUtqAOfwuM0gjATOtKI2NBPFP5TifjALQfPCxOMBstDo6A
         dhnxfSXAIe/p2KdsVnlUAM8kTXvg1yuuMY/AIsyLzTdW2U+M83vOVS/7uN30vtN5U+5n
         u4rv2pknsJ8FtZhr1b72bd7ZTe3h6fbBpi8VhehXONh3OH34dinSJOi+pk+LY0lLNakw
         q4rA==
X-Gm-Message-State: AOJu0YxsCuymSerTKNVGUKnAg8xcYuivf9n9xewVJ68KfBshPx6YUE7H
	cfULA340BQyqvnrwLXYPLWUmojoGR+vnRAKygfyuj+XJC/nQZOqc
X-Gm-Gg: ASbGnctT8p34aYuTLM1o4+tzQ03gsSdx+y4pn3Vzr87wZb83MJpaKDH1wumbIwPE9Ve
	+UXs82/LpDWs88yGwv+daQapNdD4qIAOLbxrxAB3KnJz459rW5C79b+3IX3WUNQVyJYqfkooStX
	rWIH9ldShf5FfjPv3uLlHtlGGKwQKjlXcaJ/i0iugEadPV6gpkfavC224Rk1P3DRHHDIv7ZRMBx
	unX1mHDXlcCevgakxUq+M5/WAk4yV790UNtEujxJZczL+xiz4gmXxIhIQXX+inZ2NqW2vjInz27
	cREFdGwNF5OmRdzlFBWPKBkOuoEsx36m9eOOKp7ul1kziMZXIDbLWy7VjcH1G8RlqtzaEvO8wfA
	4bTyQy68zPM1EgYf2G4FQ8y0/75YqyDAxD21Cv5hGsDi7x3HfNXxx
X-Google-Smtp-Source: AGHT+IFYG+4lKrUQRMI8+2vlGESDtnYJ/Cv0scShCKDuN9BYQE87CMSXbDjZXwStM+jyqy5BA7zP+A==
X-Received: by 2002:a05:6a21:329f:b0:1f3:20be:c18a with SMTP id adf61e73a8af0-215fde5b623mr3695103637.10.1747219895988;
        Wed, 14 May 2025 03:51:35 -0700 (PDT)
Received: from codespaces-95fafa.2t4prynt4dlezbzls5ze3dxsqg.rx.internal.cloudapp.net ([13.71.3.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a104e7sm9482627b3a.104.2025.05.14.03.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:51:35 -0700 (PDT)
Message-ID: <682475b7.050a0220.1cdd73.481d@mx.google.com>
X-Google-Original-Message-ID: <20250514105112.184925-1-10sharmashivam.com>
From: 10sharmashivam@gmail.com
X-Google-Original-From: 10sharmashivam.com
To: skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	Shivam Sharma <66767992+10sharmashivam@users.noreply.github.com>
Subject: [PATCH] docs: fix kernel-doc warning for DC_HDCP_LC_ENABLE_SW_FALLBACK enum
Date: Wed, 14 May 2025 10:51:11 +0000
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shivam Sharma <66767992+10sharmashivam@users.noreply.github.com>

Signed-off-by: Shivam Sharma <66767992+10sharmashivam@users.noreply.github.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..c8eccee9b023 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.49.0

