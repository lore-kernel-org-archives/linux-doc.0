Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C7115253E
	for <linux-doc@vger.kernel.org>; Thu,  9 May 2024 13:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715261472; cv=none; b=dwwSoKASKPy2aXAeuxJ/tv6R0h7Sv3/JqjC55gqg34UtV+VTy21q5RtuALYlEQzjieMEhstv6twgjkCV7m+NdaP75TFgZqD6kZQCn0SiVvTVSqg1ubHGQYKtTSf638niFI/WtWIHo8X3GRJjI4LGIRKUOgc70jFmW6YzPnh0W7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715261472; c=relaxed/simple;
	bh=m2zEtruGkvxujMPhBXY7kQd55f5ocV/KfUBbo1KLpSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iZ6b0xzGRk7Mtuf58KCxnEtxD6U93/FompXGwLldiS1xOreisEcqVHlgTfZ36D/tj6gl4VsBQCvNRZ/VzBmiB/4eemjd/BGQq7ufkjHqpqsHRcBYQCEKZTmrnBUA7EIBqrcX2b9Pv5NyOOduCMC47eDZjZd+q262JXdgd8K7tV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wyuA16OA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wyuA16OA"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so953890e87.1
        for <linux-doc@vger.kernel.org>; Thu, 09 May 2024 06:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715261468; x=1715866268; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r33dW7cmB/GM8ATE+hQpOZIrBaphuEwRmQOpy16eaJk=;
        b=wyuA16OA9c4xcLj4ac+mA4NrgzqlNMOp5rg3RcOaGKIt4PleViZOPZhJ5WxD7wf9+U
         PIM+GMjQFO4J1e6eBysEDnZNOhTtCVTrZ3u/DLun0KpF0IlRyml9hy1B1OzqjGt2K+yJ
         ZkUvCRNU8lzzhIgfxPcRyTsaIbtY3IojAUM2TOT8RNu6bXdENU8XCusWewPF/ALOR7ku
         9BKeYq0/kfTxH0ehZL+bpYmO5dmWWvXaOmmW4wFqn4TVuUZQQo2Sio7ZQ6dxkceyk9xB
         wDWUhqKZ2igA1PdfUFlkpw47jCO84RIw6T6jbeIL77yoZ4DO34Wj6nJIUH5Vft6iBdM7
         x9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715261468; x=1715866268;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r33dW7cmB/GM8ATE+hQpOZIrBaphuEwRmQOpy16eaJk=;
        b=XGUHkYVRz4HrDurGQr57PNNf1aPbJYCR5wVoUHom7/dvnXnYxb58KyODI4xixv8rrd
         XbMwlS56nRZMXd+ajoxyiYOart7qaEqwgs4m9jVQFQ/Cw3bJcakY309iIgzk7v4M+xn/
         jpVUEurC2W3OdfHqFVOlx1ScSJ5I8OLmgQty6GiWH4d2FEPR73cli8HLL6WWAZWP3gXA
         +c0g6duGkw7evrR/0PQjfqvv4bYO753kloKswuOrw1Fy7ycwJE/rXRvyagKwE75sB+qW
         ghcrLBEI0Em/HHrOnJyq7fqNzYQOAlvdDuHtqH3tKNFdMkxmxmG5GUi//b4IbD8LD3NF
         kcjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBbSuPCu66GfhdIHPW4yetIhWaod6WX5H/YfxiP2a7fciMJ0CcTvOhX/hnTtTGm+H9X+k7Q2xguvsHpQMHeI7KaV6v1FZEuqnN
X-Gm-Message-State: AOJu0Yw/yviwgF1tpPYGeysZzCrC9UpVG8F/ZEAkjUIewe6lF5Lbphju
	cLyCDfD+j4jOBzz9GNtokhoXmfYNqWFI6NR/LgwMWp+aNOs8uHzZ4mojbb4u/mU=
X-Google-Smtp-Source: AGHT+IGIi4Tl8j+UerHfiw+tKEBIcpBqxthj+u4dQ+d8NON2NF/1TsiNDVaH03l0MKLov5/iuRPKUw==
X-Received: by 2002:a05:6512:b23:b0:51c:f21c:518f with SMTP id 2adb3069b0e04-5217c27c36dmr4667766e87.12.1715261467693;
        Thu, 09 May 2024 06:31:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d367fsm294566e87.297.2024.05.09.06.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 06:31:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 09 May 2024 16:31:05 +0300
Subject: [PATCH] docs: document python version used for compilation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
X-B4-Tracking: v=1; b=H4sIABjQPGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNL3YLKkoz8PN2y1CKQUt1EiySz5EQjQyPTtDQloKaCotS0zAqwgdG
 xtbUAHGnRaWAAAAA=
To: Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=m2zEtruGkvxujMPhBXY7kQd55f5ocV/KfUBbo1KLpSg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPNAa5VIUfz7hTsz50vCSYcPRyiOjpAP0rwDte
 rlsD/kOqriJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjzQGgAKCRCLPIo+Aiko
 1SxAB/oC205Rgfupf6dxpqFBFVJhaoZiJlIjwQWT+zfYMi92ykQccxZj7Qy3bVawLRrUo23vC8Q
 BLhTPBNplGA9OkEp/5goS084ThepWCY6xdBBLSha6PEEPPTtIQi5Q5jC6Tb+KMQ7TduZbwmH8nq
 ogkKYKqzSDEADEybi/tJc+/6gP7vuI97Mv+OyXK0gNThg9AJcnW5K1aZ/v1u1qNWIVw8hyEStpd
 g/10UDekOGJQsO6vpyIcptXKcopqIaxCPqgo20WeD1RbFo9RwVKQGwWzC0nAVhobYfOBCDeTT3X
 kN8f9G9VEohrzHtr+a0GvxzZlSMBOFbMhZTEhxOP8H2Z+bug
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The drm/msm driver had adopted using Python3 script to generate register
header files instead of shipping pre-generated header files. Document
the minimal Python version supported by the script.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/process/changes.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 5685d7bfe4d0..8d225a9f65a2 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -63,6 +63,7 @@ cpio                   any              cpio --version
 GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
+Python (optional)      3.5.x            python3 --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation

---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240509-python-version-a8b6ca2125ff

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

