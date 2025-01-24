Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AEA3224;
	Fri, 24 Jan 2025 17:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737740048; cv=none; b=ZBdGtFKJj5Ga8+K5idt0Bg0ElhEECLaXYFyT1u8oeFzu42mVh45/DY1lBin/dPEMCaRSdI5bwsc3ss7mqVLTQV1FZRZpNJR0/lCeedcfPGOfDMdZVYin/2E1jeeCnA6pndRd+f0iW5lPMzSabhRhmdq3n+uNOK9giP/gRgnt5TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737740048; c=relaxed/simple;
	bh=Wfb3nCJHrFZ/ER3+NaAKiTIh4tK6aoLhRwbmFqRcZq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fomik6qGZAx+SJoZmHata78Uo9CDbmxTvPb1nnxF4qH4mIfInuzdOvxXwAUnggCc4FO81Yf/8cwtHY1lk5CjfcNqyQ3t5Jphrcq8PHyYxJ4rsyU6/EnsK5HwizDs9Ff8gczZlMZ4mMgiXTmr8fYJzxb7TKYbVaTJtHxx8BPTRjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVDoYpKz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVDoYpKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54CDC4CED2;
	Fri, 24 Jan 2025 17:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737740047;
	bh=Wfb3nCJHrFZ/ER3+NaAKiTIh4tK6aoLhRwbmFqRcZq4=;
	h=From:Date:Subject:To:Cc:From;
	b=LVDoYpKzXIJX9ChjvY3/s4fCfrmROugPfMq71vG8hIdFhyBgKuqH0zexCVZzWrDth
	 c+1nh6MrS40V6dh1kInB6kwMnlgvKr7y7SeHTEoqp8L0ZbrzeJFdxLgwIrm26X3qCh
	 QtAGmGSg+XYr57rODjCCTgKoaGURk3N0cnT4HAWZpE/MKKHCzsaBp9J/fcpiqB5PYX
	 /7Nq0a2VtiHezyZw0Vi76DOQo4PeZPqFuJ5SbvYBsDP/4ko45/gvegx0wZXy/CFrWS
	 xZUpSbRXNAEu6YIgEfn0f1M4IG/qYtWN/7Y1XB5ju49mFCV1zISY5hnBUJdcI9J6AB
	 jr1WZx+vwjhNg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Jan 2025 17:33:22 +0000
Subject: [PATCH] arm64/gcs: Fix documentation for HWCAP
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-arm64-gcs-hwcap-doc-v1-1-fa9368b01ca6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOHOk2cC/x3MQQqAIBBA0avErBtQ0YKuEi1Ep5pFGg5UIN09a
 fkW/1cQKkwCU1eh0MXCOTXovoOw+7QRcmwGo4xT2lj05RgsbkFwv4M/MeaAbhyiW61WZvTQyrP
 Qys9/nZf3/QChb8zqZQAAAA==
X-Change-ID: 20250124-arm64-gcs-hwcap-doc-576d5f41027a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Yury Khrustalev <yury.khrustalev@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Spickett <David.Spickett@arm.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Wfb3nCJHrFZ/ER3+NaAKiTIh4tK6aoLhRwbmFqRcZq4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnk88M8xVJBNItAkMMTYAz53ygbsLKSqUxNKWD5HxM
 wskB0qSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ5PPDAAKCRAk1otyXVSH0Ic5B/
 9JtV6z5AGvOTKCCbgK/5m7AhexBmNehPccFzXR4jInlgXQ4UcR052/3PXNHGSOgye6MYfwAWWLQe0h
 O3I6rkdWLHv9crGWKeN3wOfT8/DnbCoT7e8Dr8TIfpr0F2ooPDS3yBOZpNYR/HCjOlmZLlIoQXO1VZ
 IggAi1O3wKVSRFa9MRGoRiE+zD3CEW+Wbi/piOiYqCdT6YLwR1sfAq3eOGj/l/VnTOu10Cc4QLfYmC
 xXheoRbeovwv1gIFwyMqn6A1PV942WgmH/D6gdQc91f+eOvQkDJuBGP69Q/VN9Bsl4L2PGykWcy9qz
 MnDSJ9umh6TDdrhwbKHHU+uluossqb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

In one of the renumberings of the GCS hwcap a stray reference to HWCAP2 was
left, fix it.

Reported-by: David Spickett <David.Spickett@arm.com>
Fixes: 7058bf87cd59 ("arm64/gcs: Document the ABI for Guarded Control Stacks")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/gcs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/gcs.rst b/Documentation/arch/arm64/gcs.rst
index 1f65a3193e7765dce9bfd6ad88b9fbd6a225ed86..226c0b008456f28c57c2221f45eed7e99610be46 100644
--- a/Documentation/arch/arm64/gcs.rst
+++ b/Documentation/arch/arm64/gcs.rst
@@ -37,7 +37,7 @@ intended to be exhaustive.
   shadow stacks rather than GCS.
 
 * Support for GCS is reported to userspace via HWCAP_GCS in the aux vector
-  AT_HWCAP2 entry.
+  AT_HWCAP entry.
 
 * GCS is enabled per thread.  While there is support for disabling GCS
   at runtime this should be done with great care.

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250124-arm64-gcs-hwcap-doc-576d5f41027a

Best regards,
-- 
Mark Brown <broonie@kernel.org>

