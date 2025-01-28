Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8723F3D561;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=P2QZ9l8cMOpMaoHwsvZ5NgNrbcee1Owwz94KGP22zfWZKZxtgeXSh+7+uV+H84HeAZQe+F8Wknx25Plsh5QTO8SDBDjGYrXp+c+EntpB4I03qrzwW26PfYUM/xbDbn+Hg1U5pmHzCp6aR9fwDh0UMSXrX7lcanBR37p9D0KpCBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=ZlYS8/RGksFoYa5QMgx8JgmK5kqKi2Lgph+Ezj5n8ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XSKS3J1vLdzVDuQvqI4aWdUZFGhXilLPwjeOMjD96aTHB52h+BnsIigvSCbBodaXUi7hBjrBazsaXz7WqYaD6ukeIfyoy7jbAjxp+1D/AB9Z4YTJrSP8u+MhSWJsiRFyw28OEfH2J9TJtJ/607m0GLCmUiN1MKU96+qGGH7gGBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nI90iYlc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nI90iYlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE32C4AF18;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=ZlYS8/RGksFoYa5QMgx8JgmK5kqKi2Lgph+Ezj5n8ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nI90iYlcLydzPEo7oi3Q9W9EddFrzp4G1Ae9CdRiAD/6vapq3z450BmV6vSkDdDYs
	 kuYR2iwFak2woWBn1o5MnP2tTdJ4j1ssVNr59xHACzj0h50PWrAz+SkFazSAEMx8i5
	 67c0FnqNifnCrqMsx8URUspZIeD0kuLY2n9EK21IUmXxqyEnmJQ+PbxMdluaWbZgcM
	 oNW8pfk0+g0C6sSsxRu1kmNbEFP4lKK1aZTGnz5TJ0ndm5au/fINspJtSQVWOfXaR/
	 8EqXVHntvzmPMJYqrzsjxLtkD6kCYwKdpYx0Y1VnPVM/CzPBHsprTsCVhlMA4bdV8d
	 YjSEzBwIgoaoQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRMk-2FW0;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 36/38] docs: ABI: drop two duplicate symbols
Date: Tue, 28 Jan 2025 01:06:25 +0100
Message-ID: <673e9543783349b0fcf625018e38e4e93fe98f52.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As warned by get_abi.py, there are two symbols that are
defined twice:

WARNING: /sys/devices/system/cpu/cpuX/topology/physical_package_id is defined 2 times: \
	/new_devel/v4l/docs/Documentation/ABI/stable/sysfs-devices-system-cpu:27; \
	/new_devel/v4l/docs/Documentation/ABI/testing/sysfs-devices-system-cpu:70
WARNING: /sys/devices/system/cpu/cpuX/topology/ppin is defined 2 times: \
	/new_devel/v4l/docs/Documentation/ABI/stable/sysfs-devices-system-cpu:89; \
	/new_devel/v4l/docs/Documentation/ABI/testing/sysfs-devices-system-cpu:70

As the documentation at testing/sysfs-devices-system-cpu, drop
the duplicated one from stable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/stable/sysfs-devices-system-cpu | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-devices-system-cpu b/Documentation/ABI/stable/sysfs-devices-system-cpu
index 902392d7eddf..cf78bd99f6c8 100644
--- a/Documentation/ABI/stable/sysfs-devices-system-cpu
+++ b/Documentation/ABI/stable/sysfs-devices-system-cpu
@@ -24,12 +24,6 @@ Description:	Default value for the Data Stream Control Register (DSCR) on
 		If set by a process it will be inherited by child processes.
 Values:		64 bit unsigned integer (bit field)
 
-What:           /sys/devices/system/cpu/cpuX/topology/physical_package_id
-Description:    physical package id of cpuX. Typically corresponds to a physical
-                socket number, but the actual value is architecture and platform
-                dependent.
-Values:         integer
-
 What:           /sys/devices/system/cpu/cpuX/topology/die_id
 Description:    the CPU die ID of cpuX. Typically it is the hardware platform's
                 identifier (rather than the kernel's). The actual value is
@@ -86,10 +80,6 @@ What:           /sys/devices/system/cpu/cpuX/topology/die_cpus
 Description:    internal kernel map of CPUs within the same die.
 Values:         hexadecimal bitmask.
 
-What:           /sys/devices/system/cpu/cpuX/topology/ppin
-Description:    per-socket protected processor inventory number
-Values:         hexadecimal.
-
 What:           /sys/devices/system/cpu/cpuX/topology/die_cpus_list
 Description:    human-readable list of CPUs within the same die.
                 The format is like 0-3, 8-11, 14,17.
-- 
2.48.1

