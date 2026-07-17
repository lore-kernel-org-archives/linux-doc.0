Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FB4175A69
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 23:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331141; cv=none; b=liEkX1y50sNwRRiBK45r4nX3kFaz47LoZXrKy+uwrFgPL7C/aSc9nY/UmIUIbVmLq/V2PKsioUDxoTOvHDEIcksF7tRsKV7C/yClr/i8RfTgXsrOqRkroYdsqzflCmRLKpmDw1sAHQcKq1IIoUGlyePNmY2H47fIP0nuq9+qaXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331141; c=relaxed/simple;
	bh=s0LMm+OcoPpmqRB57FW8WPIACTHAgSpt/ofOePUvqwk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=rAy6/UyLvbT5QVTYVm8BMcbS83GLODgaN0JXO9nMfrrw9MYZjLyCSTfAGT2M9h0ukgBMbczqfaCmvVP/F5Pr5KtknJiyCxqbhjARBs/EWZfFLrjUY1MFH2Lw4J8crXDhQ2e/oGyp6KtlD+H+xas/j5BX2Xey0qfbQojanjE/Xkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=OEtm2LN3; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="OEtm2LN3"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e85499ffbso399108685a.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 16:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784331139; x=1784935939; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R+DUQOwOw2uIV4ajc2HeXFDWOg42tRR4f3JX3Z/V06A=;
        b=OEtm2LN3Dsz9hqIcPhUOPubE2FmzPc0aKumLQKhlUBnK7oTCcRu35TWCVq44o5685B
         rBcgA3oTit8bE+bOLRCfh7GTrMo+xqlHe2tqlKFUaTeHD0vey8o6/FLCPtu0mFqcqXip
         6Q7siChD40hvvjgVDEHL27pjkOxjkNUKdLhtOw0Cujogo16+eGSDS45daVjlE8IYNbom
         3WDU/fCVyi+iXNW0fgOehju2M1RFqAWc7vVxa9gTAGJgzldQkAH7I6lli9ouPALUjbjI
         JSnex+GZDzffLjDcery1Qu3loDCtnoZ5ZL2w1QZQbWfGdD/tBXquIwxZRZnnCdsZV5tZ
         QVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784331139; x=1784935939;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+DUQOwOw2uIV4ajc2HeXFDWOg42tRR4f3JX3Z/V06A=;
        b=aN5es0kyzvocMyhuID+8vWR28ViPAVkXuVp4U1b0ALK8ph1Atbv0qiL0YfbOGLVJCO
         BqOPhvkfnVhaZrEbzBKsqXYdeQp6zc7VzXxi4F87iHTTWgmUrQqSTfDa3T4QiKSmmYhc
         i0X/mryZmt6F46ZiIKaiotwe165Fp5I1O+A8fbPeQRqV27jYb3nRE4UOa5AEJ6oDB8jD
         OpP8JOniCjcqJbyMzSg42Gk5Sfu1sVYEkALPA7HjfgBxhRaIilcr1426P7lgmm6iyfqB
         4aPK46eIur6WeyddW2NHlTlHsfhR8HKfqaeaUUVmWhpYTJi/Vx51MuwjFMk1XGosE3Lm
         ++Sw==
X-Forwarded-Encrypted: i=1; AHgh+Rr93pWhsF1k9XplHhDhPeHiUKhaitxAKqI8xI/aT4dcPaZiBaMlXSM8NQqB/L15WFfi+AWxBwa3RSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9j9cLRz5l7CMwCq5QEsASDiRa6uG1hpHP/ngSMG6JmTboOG0g
	JoJCauwZNcAKUVdUN6VWFxNV81+pKjaN3vRzR2O9Oweypx1K88WSf5j3m15AgY25Geg=
X-Gm-Gg: AfdE7ckeKctKWRfDwlJKAYHxozeCPjXFR4osR8a/0fJZXGpNdtvPyigcVBueY8EM8Bx
	9MQ0LbLAXahM30YLdFSAoisQutqzej9xJ9yKbuOrPsa7folflTGCEJeXQYWMA7D9MY1WLzt5EfC
	D+ndYrWp7q26IJ07QE8H94yLfHQS1lJuc0ghlI79kuiZuOYUa5FZHxW5tE1Cpo+jkniv79sKDET
	zLb7WSPrsLeIBvelhw09coxvxWBsAGW5Zk++uhkhfqD01eYjjDFZkh3RamM/7NVNeFzQEEz/RHt
	67QHkehNEYj7fkTKEFFN3/PcxuX34Z9zEPFUnbuULSllE6oiMsI7XuijtNBHVl/8mQLqX/9Hk03
	KO9Di+Zs1Zcm0f783JXRnP8Tq+SWt2u/algdVohfUbdXsukOI/uukEy1qlcZZ92MWk5CE+O800x
	mwc6J4v9ytVk8i5KD2ieN5OxsAGRygwBlIyXiwdFg=
X-Received: by 2002:a05:620a:472b:b0:92e:f3ca:2ecd with SMTP id af79cd13be357-930b41a0733mr524243585a.60.1784331138856;
        Fri, 17 Jul 2026 16:32:18 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm279957485a.35.2026.07.17.16.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 11/12] PCI: liveupdate: Do not disable bus mastering
 on preserved devices during kexec
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
 Adithya Jayachandran <ajayachandra@nvidia.com>, 
 Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
 David Rientjes <rientjes@google.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pranjal Shrivastava <praan@google.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
 William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20260710212616.1351130-12-dmatlack@google.com>
References: <20260710212616.1351130-1-dmatlack@google.com>
 <20260710212616.1351130-12-dmatlack@google.com>
Date: Fri, 17 Jul 2026 23:32:15 +0000
Message-Id: <178433113516.189683.9930130364443329744.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=563;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=s0LMm+OcoPpmqRB57FW8WPIACTHAgSpt/ofOePUvqwk=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqWruB0abwGG0XPrEN8HQE9RCrgd8/buD859gp2
 KaKebSgf3WJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCalq7gQAKCRC7dyhM23N6
 3mj7EAC6bErgn8QbHlK63bz1p0Z8+rEQtPpeKYfyZoG2uWv9cDi5gkXPAA2cyXTEg8FWk+3dxwk
 y6gytV5WrSayDd6GSc5dQIvNqT/DfySvbzgAES3hjQEYplR6GGXtAvSOJrQm3brDRl3OO/+Jyt/
 RWwegnDu0EtMTwd45jI8iO64zYNbU6iXPDmoo6XX85I5an+0rvaOq2+751osnajpvrUctCRX6co
 rct8df07a7hqEr30tX3CdeA6FpiPhXcSZdcc7Y/mdkIvSPqDsKQWLerNa66FSM/YWQRJyQz75aK
 eh1RdPuqTNnMgn57asyEoYg5pPIxn2wSy1R2+6bmZnsj7Bfhs8kivkdPulT2cq/+tDvb/i1R8cg
 JRhN3kONqgHydgwy6TrTDZQzDKLE1v70UqFkEmihAIJqaxEBEeMylAu3uuCt/3Xf/N8ePqlq4p4
 Zl1+UFEzR12poe688gj93wg/k5DYz12wvCyUaVd1ftxDmqLc5IbkfD19MjDTMA2VHhZ2dygKp+5
 jBzpCI2Ct6WYvMfudLSRjaT4vueHL50oW8vh8gE2xIOaoOwkDXSTmru1jcXLEpWZBDxDnjbHWx2
 A8HHgGX6czH1+b8pT3wyIyMQzrFYbow7ruhbDMctEsSZ9cOZE5vkRTllxa+Bfy5AWxoJFldiSFq
 vnDsQy6niCySu6A==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 10 Jul 2026 21:26:14 +0000, David Matlack <dmatlack@google.com> wrote:
> Do not disable bus mastering on outgoing preserved devices during
> pci_device_shutdown() for kexec.
> 
> Preserved devices must be allowed to perform memory transactions during
> a Live Update to ensure continuous operation.  Clearing the bus
> mastering bit would prevent these devices from issuing any memory
> requests while the new kernel boots.
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
