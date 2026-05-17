Received: from outbound.st.icloud.com (p-east2-cluster6-host5-snip4-6.eps.apple.com [57.103.76.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4E5218845
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778990871; cv=none; b=mfUsZSOExPo8e/EZTnVdBU5u1C8/IPRFWxxflXK88ZynS9LFVdrhtBHpv/2obM3/24Yt0PocGh7jgLIWPzu7qz/ayeFsxN9HdLsVYq5BBrCfzTmU6DpXs9OFZl475d1hZwsKCdb+NtaTD7dHwvCmDkgYHHHmRWjJq9SUYnHqWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778990871; c=relaxed/simple;
	bh=5OVmXOE9G5W892e6MOYYRlgD7Nx1v1pILOrR+bGwzz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kv2xOmfLV26qa9McfSTvNSQePbN5OJPmJvKPj36zYJFAoTbFg9j+sbrnyzUSNSOrT4j7sKMgUsnVEO2mdGTx+E5buLBMJOlszylM3csC6gH0LOXJi9+AXRholL/HmD56DOdWfz5CdnQM0gBHjUBJQ9w4UIj65oWcyznlBQpfylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=xbgK0XIl; arc=none smtp.client-ip=57.103.76.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="xbgK0XIl"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-10 (Postfix) with ESMTPS id 8EBED18004FD;
	Sun, 17 May 2026 04:07:47 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEC0AFBlgARnkRUAFYHlZeWhdeTVEPDwNKEAJeBV1yGVoUXBhTRVEfVFhBDgpeEhhcFFxQWB5GElYNXQkZGEZeUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKVwBAC04DWAZcAkQJTwJZGVMCQg1VAkBEGFpBCkoFLV4IXh9MHB0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778990869; x=1781582869; bh=0RH1w1DYDkjsjyaPhmeQU3p7ISS9hC8oHjOo69xk0aI=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=xbgK0XIlOXS7rpy/cRsYUErECj1ehoMpOyJYMRPThrxAhB/bty2ewLhwXL6lPvwSsASFS3IvuaMIl6TregsN/yyf9RwAVm0y2jOF/UvBSwuZ/oxj3BYAm1bZIkFnae1ZEjc3ex3qTomOCi+HxwunNs+JoDA8QtwXzesjl6PAswe6aWIGcNPUu2DcFiLAgeihT5iizsfzyKrObN9y3S6crqKgXFPnEEpcleL9+Ko3ReQ7FS1AlJN/1ZFvY/DcPpN+vtbarNydnJbA8/kw039CSmxXiw3omgbvyJqTzAMyATyK79dt7EhsXUf6pfWoDLUzIQhf8UwPh2RhDjlR5SXtUw==
mail-alias-created-date: 1778972301885
Received: from localhost.localdomain (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-10 (Postfix) with ESMTPSA id 2ECA81800602;
	Sun, 17 May 2026 04:07:44 +0000 (UTC)
From: Sakurai Shun <ssh1326@icloud.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: fix typo in list.rst
Date: Sun, 17 May 2026 13:07:11 +0900
Message-ID: <20260517040714.8024-1-ssh1326@icloud.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=MaZhep/f c=1 sm=1 tr=0 ts=6a093f14
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=ZxuoajvSgW0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=n5eNGPCNNo5IhVjF31cA:9 a=zZCYzV9kfG8A:10 a=IxSG75etxsVYPPdR13TJ:22
 a=inEeFAWOpojiTzPHIy75:22
X-Proofpoint-GUID: pMUNmJhyvQQsmqy5_9e7dnzc-AAM7_7G
X-Proofpoint-ORIG-GUID: pMUNmJhyvQQsmqy5_9e7dnzc-AAM7_7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA0MSBTYWx0ZWRfX0r8BNs8zk21s
 6127XZxX4Tk+jxuLYueZtg0gwQp3J1oFoE4QpLlCUkbSRIL576VPOgl3tME+ll4gYFzM5HlADVc
 rJkFfzK7IlcXt+HxVXbSMCP5cUltOtR/CKgZOUJ8qqMbpY5gv5EhzeMsENtPbn2qiSjxYecrq3k
 ws173qeIBWLZDJYa+ZARSecf+i1aAgmQ2GHycW4/kWryykg1c3yYV7ql2ljqTmDfyIlhX1Yq9An
 AkvRgcwgGblKvSG/gQEgvFuMySqlWdoDn44ibAW2+/qgc7BTTFjtnF3onmK8nk1EPzYexHLIrM+
 RJNJsDKvJjfy+/udmvQQkbxey7EwkyWXV8+AlRX+m1iWmhnYpEQDuYbEEMa1YU=
X-Apple-Category-Label: MjE0Nzk4NjU5NzY6JGNhdGVnb3J5JF9QZXJzb25hbCw=

Replace "reinitalizes" with "reinitializes"

Signed-off-by: Sakurai Shun <ssh1326@icloud.com>
---
 Documentation/core-api/list.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
index 241464ca0..4819343a2 100644
--- a/Documentation/core-api/list.rst
+++ b/Documentation/core-api/list.rst
@@ -752,7 +752,7 @@ This is because list_splice() did not reinitialize the list_head it took
 entries from, leaving its pointer pointing into what is now a different list.
 
 If we want to avoid this situation, list_splice_init() can be used. It does the
-same thing as list_splice(), except reinitalizes the donor list_head after the
+same thing as list_splice(), except reinitializes the donor list_head after the
 transplant.
 
 Concurrency considerations
-- 
2.54.0

