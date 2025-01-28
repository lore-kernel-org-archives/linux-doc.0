Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E53F2A1BA;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=naUcvmnrTq+RrHzVV7vJ7iV/tzUCp6qGpv1tslsBjiZeRr3DZtmuqEcoIGCAF+gOnPMkinWP7xty2kucIeXKtsqV9Xdu4zYgCMX0BLSJ68hIwAvKUufZpf76qk8Ahw5EOAtQINPKmeS9D3qm+c8DuI04dfcikJtfew06QJTUxkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=EIzss4+nVhmBM716ght5tv9bi2u8EXv+0cXIqsZnexs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlGrucWUphuXAzHFicMDqczmAokQk4CmFSnjf0H+/e2HJlrCBmJPNMns5JnGIlqwHG5g/XYWy+0w505mc64Ag3QflrhhY3xmOTjT0pve8/rYp1O1ncW7WTUdr9r4q9wdTx9CMnhqeoHTeqObt4e7ye91bfPd047PSEFFH4feDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djWGZdEG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djWGZdEG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2145DC19421;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=EIzss4+nVhmBM716ght5tv9bi2u8EXv+0cXIqsZnexs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=djWGZdEGjm9gYcPBqwD1BId5hx3PKr9WOW/SdWmMGopvT/s9r4KPIaWYZ42P3QmPe
	 yiWYVC/WOebllm9+pH10GNUWQYEWSBHukz+fhipIlxuy8wfy5wjUHj55pYqSLMJiHR
	 38it1cy4s4Twd3lnlSiEODudYqo7BoRiU71oWMoRxmI+6tgdo45Khz+JyIDItTTozp
	 uu4NiDvv7EvlCluUpP5zkNUJgfjjsSrkg7Yz79PggptS2k01fSUiI1J29NqvfguhSc
	 zF0t8io4PvGctFMmRLaAEBXsNowUEk+0hA2ijqQNBgVn4escrv7N0DQATNRq6m1Mf0
	 UREfJZjywdwOA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRMJ-1ZDu;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 30/38] docs: arm: asymmetric-32bit: Allow creating cross-references for ABI
Date: Tue, 28 Jan 2025 01:06:19 +0100
Message-ID: <88b0601a8d6e6f23fc3ad2a68b552b66df190945.1738020236.git.mchehab+huawei@kernel.org>
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

Now that Documentation/ABI is processed by automarkup, let it
generate cross-references for the corresponding ABI file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/arch/arm64/asymmetric-32bit.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/asymmetric-32bit.rst b/Documentation/arch/arm64/asymmetric-32bit.rst
index 64a0b505da7d..f15061b1e020 100644
--- a/Documentation/arch/arm64/asymmetric-32bit.rst
+++ b/Documentation/arch/arm64/asymmetric-32bit.rst
@@ -55,7 +55,7 @@ sysfs
 
 The subset of CPUs capable of running 32-bit tasks is described in
 ``/sys/devices/system/cpu/aarch32_el0`` and is documented further in
-``Documentation/ABI/testing/sysfs-devices-system-cpu``.
+Documentation/ABI/testing/sysfs-devices-system-cpu.
 
 **Note:** CPUs are advertised by this file as they are detected and so
 late-onlining of 32-bit-capable CPUs can result in the file contents
-- 
2.48.1

