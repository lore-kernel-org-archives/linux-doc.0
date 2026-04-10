Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9281340A57
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823097; cv=none; b=VMIY9tt6amNrHnD1JBRndYQyVi1IVARthNDderJsa6G5T+Wnd58LyTPg7ML1XtsM2tZG1LQjgrd142zIgSjbjcOofGscvGXIpCbI4jFcIyQhHZRRnrKRdOFJakPDSkW2cttsPSi5Zw2TVhOiRhfcoHjw6Di9Cl0B1e9Yq+zET7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823097; c=relaxed/simple;
	bh=FztPS0UQeubSwIKvX1X4/qNcd1K+zFW3IouJYfHQRog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgGWCrETbGK0sA69Ze7RD7DoEruBitnSp9gXNsTbAcNN7HViFo3HSudITG5151GdrDYr2ed3kYEHSrSwps2CcLUEUZrwWmrlPAVGTMEnDGI2ennBn1v6thklI7dxyalwFfbfWwjvUw2mqWySNzqq3X9UhQ0kXRofnsm9bdSlWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r21uG3S8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r21uG3S8"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f0884bcfaso785599b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775823095; x=1776427895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3f2VGjlp0zrHnZkKgCfeyqB8lCSoeEC0x2mfrr6vdc=;
        b=r21uG3S8Yf7GKA6puyKNqqobrXby2ZuX6NemgfXzB/uiZneB8KZ/m4kHNZDcTClDn9
         x9LrVgxach9F3J0yyJXFwiAfBpgTF+iwEeylsYiUjKIpVKVXs7Aqw5ePjB8pxKuMwtmU
         I3qLozhvF1PJvIlb1xVCPWf+JcPCcKv7sm6rrCQcEm9J4RIY5LSlIUT41E2d8sisRLMF
         aB+kIk0kH8Vu3FrY5/RFCyqlo3GgQ/smcvENWsFCkop6oQCQexcuJlhdXOW6XL1ttXMP
         uopLmO4L4TcpyrhMYwx9FDKxfo1CYC5S3NDDgc6o7d5rEo0B5Nd5xJ1npAAP8W+5IJKr
         pqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823095; x=1776427895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3f2VGjlp0zrHnZkKgCfeyqB8lCSoeEC0x2mfrr6vdc=;
        b=S5OniMSDJzJ6ddE39a8aHt4sB4u4HPBr8kuvI5r2kQXML9RMlnft/QSQPxTqLwy4L7
         bplKu18VB/QwKupZCJKQkq+ivDz5QiWp2EAlWr1yqzj8CotxJ+mEtGd3hfmOfF0gLNFK
         aAeMYvdHjugvhiD/LdScZmpwXjCLR8V47V4beEjnvNniYoWOhcT1KoA2TMWdaQ9Zsr4R
         PTCdSCWCgLVujMvnWzldzt83tgjpyaBkp9L6Qf0vqsK97n529PtGc5iE/WcVjEgYJ6iN
         gqVlk9IsYzAs/YiUctSD+wfff96C4ZMG7XccpF8DMNRve8iqXEkP2XhDnuyBLY5T8h4r
         qwcw==
X-Gm-Message-State: AOJu0YyTQe1B2loylAuPFNDgm4PqJ3giKR7YWzgfusjeMmz81XONW6+a
	aTghK2WGIwIgssn+g5YL4oSQcB8iF6aNY3OqjUAdgJzv/baPJGjWwX/m
X-Gm-Gg: AeBDiesuqQEL5dKcmhLgLb+XtNNAXN5582YkgEp0DDwE0Y3+GLWoQb9qXmijWCtOdUn
	xC1rrRm6Fj7DuvqeAFRFu14Nah7Dk1nGX2g41AnzJYQwxtcMdbCF60U2mWBwOLcHTuzWdfa2p/E
	fuVa4RQQY7+0aKN79vQA0Ki/GgJ/soVroWZ7FbN411YQ1sVcEP7eOH2DNCkmL31SmyCmQ0u/Mrv
	RvfaOHD7y4Y5DcxebrbRwamVeq++axkHk8lbPGgXCRQeyKCGIFYXX1p6aJ4i4LihgfNn+jMj0RG
	bV+kc/sbJs2DuThp4f7FRPH1VUa0DamEJtVwOLyIZLKg2tRoIkZzcXKt0dDnwUySbNeRWlvWljE
	ELYJXAeTgrTwB0adEn2DXneZzJQIxX9hN7ghdBHkbzKzld/AKbv7CeUx2ZkstdUNQiBBhuL+UzO
	uzubut9ZK/Weu0GElgAtGd++L8X6ICS7xif3n2MY81aaRWZoM073ItD9rgGLR42w==
X-Received: by 2002:a05:6a00:228c:b0:82a:7893:e14f with SMTP id d2e1a72fcca58-82f0c351427mr3915362b3a.41.1775823095134;
        Fri, 10 Apr 2026 05:11:35 -0700 (PDT)
Received: from ?IPV6:240e:38b:d99:bc01:ecae:8cfc:4adc:6bc? ([240e:38b:d99:bc01:ecae:8cfc:4adc:6bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30f5c3sm2714637b3a.3.2026.04.10.05.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 05:11:34 -0700 (PDT)
Message-ID: <d357e76d-87c3-4570-a8c3-10b1d8f478ff@gmail.com>
Date: Fri, 10 Apr 2026 20:11:28 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] docs/zh_CN: update rust/ subsystem translations
To: Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, hust-os-kernel-patches@googlegroups.com
References: <cover.1775786987.git.ben.guo@openatom.club>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <cover.1775786987.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Applied, Thanks!

On 2026/4/10 10:41, Ben Guo wrote:
> Update Chinese translations for the Rust subsystem documentation,
> syncing with the latest upstream changes.
> 
> - arch-support.rst: add ARM (ARMv7) support, update RISC-V and UM notes
> - coding-guidelines.rst: add imports formatting, private item docs,
>    C FFI types, and Lints sections
> - quick-start.rst: add distro-specific install instructions, update
>    rustc/bindgen sections, remove cargo section
> - index.rst: remove experimental notice and genindex
> 
> Changes in v2:
> - Add Reviewed-by from Gary Guo
> 
> Ben Guo (4):
>    docs/zh_CN: update rust/arch-support.rst translation
>    docs/zh_CN: update rust/coding-guidelines.rst translation
>    docs/zh_CN: update rust/quick-start.rst translation
>    docs/zh_CN: update rust/index.rst translation
> 
>   .../translations/zh_CN/rust/arch-support.rst  |   9 +-
>   .../zh_CN/rust/coding-guidelines.rst          | 262 +++++++++++++++++-
>   .../translations/zh_CN/rust/index.rst         |  17 --
>   .../translations/zh_CN/rust/quick-start.rst   | 190 ++++++++++---
>   4 files changed, 401 insertions(+), 77 deletions(-)
> 
> -- 2.53.0

