Received: from outbound.mr.icloud.com (p-west2-cluster4-host6-snip4-3.eps.apple.com [57.103.69.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D82F7F09
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 02:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778984736; cv=none; b=bviOGH3+16GlKDU8/YlyAhIwaZ02BPNw5bV0QQDzR3BFtU1LbU1iqbPULm23RMoF3FP5vVyDL9TVxFc7+8OvuybtD0hifzzBcQr0daI5TriITozAi+KWPlpT50E0Yni9lmtSiMqZlFgIcA9Ihrap8GeyiusEIQh9XwoqQRA9iyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778984736; c=relaxed/simple;
	bh=rVSE+K0rWl2G9FSwBLm+gvl8jZiiZrlkfd5Cakyepcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nn0AihPq7lUWc22YbYRU9mD9KCqPmXquU2RHmnEGopfR3Vq8gdD/sBfr7jnojUlYr2F80BeC8vtuaIJy+9GTWC8I2nKgx1Cx1jI+la62z0JufJK/KfpTsKwSB8gnhi5Wl+TSm4N8rULf0xpHLqNxePnz/124bo5qV9RDBxtAfdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=y8MFib1H; arc=none smtp.client-ip=57.103.69.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="y8MFib1H"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-0 (Postfix) with ESMTPS id 56A1B1800188;
	Sun, 17 May 2026 02:25:32 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEC0AFBlgARnkRUAFYHlZeWhdeTVEPDwNKEAJeBV1yGVoUXBhTRVEfVFhBDgpSEhhcFFxQWB5GElYNXQkZBkBeUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKVwBAC04DWAZcAkILTAZbGV4KSQxVAkBEGFpBCkoFLV4IXh9MHB0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778984735; x=1781576735; bh=sV6fhzrbrTX0iqeUo8xmtmUreYy8zZzFHjV3sir7464=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=y8MFib1H3rIfbmyeZl8olPAG4p7Ap2aO+aLMT+VrsSn0NHQyZWhjdTAgeVSvdLQbVt5sagfcJLwY9cOObAH3NXQ081TiUYa8f/uyNVza2l+LEU8TVyUoMNznKkOtHZroY4h80hmTgmFcoE107do9MeyTQZMkrxASZ/cbejK2ocMOYKlgTzZgz+CNOuutjN0degzhcrEWLg1OSsBhG4LZdRQosE+Q5qZkMHeqXs76ewyoBu2m/2vPWG8SQhbRXwn8Eu3ZpH8QpjPU2gMkgshOIlh3sucU/NGEro1Oqw0sx+NtLMWB77zK0Ebx65kmblx0c7p9HxVHu5Tf4PvJrsVxhg==
mail-alias-created-date: 1778972301885
Received: from localhost.localdomain (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-0 (Postfix) with ESMTPSA id 5DF73180009F;
	Sun, 17 May 2026 02:25:29 +0000 (UTC)
From: Sakurai Shun <ssh1326@icloud.com>
To: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>,
	linux-um@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: fix typo in user_mode_linux_howto_v2.rst
Date: Sun, 17 May 2026 11:24:44 +0900
Message-ID: <20260517022456.5895-1-ssh1326@icloud.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=GMUF0+NK c=1 sm=1 tr=0 ts=6a09271d
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=ZxuoajvSgW0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=A5CT-1V7y8jouT4tXaAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=IxSG75etxsVYPPdR13TJ:22 a=inEeFAWOpojiTzPHIy75:22
X-Proofpoint-GUID: VM9EXsHA23NyGS9J0AjnhSgXfyAOqHVK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDAyNSBTYWx0ZWRfX6VY+BRc+F+XG
 nkIp9McyifMfMIUc+y/mNrw6V2JKzjK4FptQtpPrnbyFR29pLrztD0PwYQJCadGjHRCNEWaG7Eh
 8+vYgtBYNESBOZjTJkpFhYKsHRjC8p6h2yOS7i5hIrq4aJC7+JW3yvu2ArTtcmS+L7iWW081mTq
 Q4BcmyFU59D1KlwPPESF5Jb3NU7+kGBZU0jaY0rS3UNVFJn1xRWAjLL1xAKPCTX3rQNT9KVLGdw
 vlljWGThqvonsz8Kwzw17pR8z+4+G9RySCHKFzQuYSuhDyQs9oumKkjizJErOVhuEj/k6Y20k0D
 UlmVV8SBQ0CjGC7BsQDQgNKrYZXuFYz/bkr0LwhX9YgAqb3W7QVFQjp5A8jRYg=
X-Proofpoint-ORIG-GUID: VM9EXsHA23NyGS9J0AjnhSgXfyAOqHVK
X-Apple-Category-Label: MjE0Nzk4NjU5NzY6JGNhdGVnb3J5JF9QZXJzb25hbCw=

Replace "privilges" with "privileges"

Signed-off-by: Sakurai Shun <ssh1326@icloud.com>
---
 Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
index c37e8e594..9224bea5e 100644
--- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
+++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
@@ -234,7 +234,7 @@ an ioctl to setup the tun interface and/or use raw sockets where needed.
 This can be achieved by granting the user a particular capability instead
 of running UML as root.  In case of vector transport, a user can add the
 capability ``CAP_NET_ADMIN`` or ``CAP_NET_RAW`` to the uml binary.
-Thenceforth, UML can be run with normal user privilges, along with
+Thenceforth, UML can be run with normal user privileges, along with
 full networking.
 
 For example::
-- 
2.54.0

