Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCC243B494
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784019579; cv=none; b=q/w/nyrneO0puCsccv61NUZkt9R1tUaAw4U68ZL40J1H9xc/xdLc46t/rlJJz0cU2lZ9QopPNMB+025S1kmLaZzF48u0fiO+aXWjoYqxp/7XieVs/+hZ29rM2aL6qc4S7x3k3vNsU2co1QBo4lPDNbVzLlMUjwOHFY8bx4rsG0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784019579; c=relaxed/simple;
	bh=eDQ47pldprt1E8F8vtbRapvR5r2on7TmJn0NmPvSu0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hb8Ju//exp3YK6vmrSPG/TdDhDnWmUXXcVpKbypad0QUKbGKDgR/wZHs9W602ft1lbkA4izZ15iMpLzpWNXtCve9jPHPibwV1sCzdFKEd+0CYnarn/HXEvb0sgNhCRDQaFvFfxDjKzKpoZI3hRpWmL6OoZzTzyOOspnWevd6BGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3kvRlXF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3kvRlXF"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso508236b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 01:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784019577; x=1784624377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgawkwvLmNqS05KN4743zXsQLMKXXqTfmnTO2uf0Zvk=;
        b=f3kvRlXF7L9RyHgBaDS1MEGXIVRVi1HoxuPL2VjrKcgPlhk4i2c96LRHsNMBZhe6nb
         ZInmzDuqmtjHaK1XDyhT53hNGzW7ibNUeXn2lkPvKyd2zQ2Z1ypDHxsRh7a8xE9dbpuU
         WfjcKhGDBv2VXMECypoGIArs9LgkGt1IP3tqQRRjSUKfwTQCS5p/9MD6SI+ORHDelxBe
         iAiRxxVNF7h7eDfoVnWXAqSpzO+rMK8rbelIiYd4OahU61vRR7YvvjZ0RgmyGMJJYR6a
         lDyDXErW3Ux5PM72PhNsXqLaAnBgSwJ1Ap/fWyualHLRznzk9f2dsTkVXWTmdn0uJWAs
         KybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784019577; x=1784624377;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgawkwvLmNqS05KN4743zXsQLMKXXqTfmnTO2uf0Zvk=;
        b=W/eLBBmvNq+49EFykkWsUeWwM+LwzxAG1twZE1UorQQ3ZJRWsH2sRyGqyF2tfChcJ/
         0cluhG35EC3BNbv0H3YqrZ5h5Colsj8tv8G5RO5+pmVUVjWemOG8BxTdAUG3EKJLhOd2
         jIpSPOc6q5kvGCMMlBIMjsknzSHcGoPlkVGu5cO6Q6AiQnmYBzhRpj0b/cxHRh1+Qag4
         l7tpAC6F7X/Y9owbkRMWPP/WCPzrodrR98unoPLAPmh8x614AqbU4NyzY8//4W5QcgBh
         n8iYO56zv2tWUY6fdHx5aJ/r7D2UeBe2CsM8VXE8mdq8TEvCvgF7U6g67/egm9aIyd72
         XhEw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Skkgbqw2INnFwEGTIhTJVz9bWAP5S3AH1J0tANsharbayW0Ktn0IHs97aIyiwqr5rMZvcZ9ePp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkJtDxbm8SA7I44EhVp2N+hv3zmegDJV+Ni3sM2a5JZ2YdEdOh
	7D4O0lrn986nxN1iNQHRao315CFp4OOcmm9qmGWKuZQZTzCiA6NVQJoG
X-Gm-Gg: AfdE7cnyOLyNhVz122MgcSRHw0JRB012rW2ruzh6v1fsQM1zLHAb3qNMY+eFdO6Uda3
	3930XAvgcRMdMr7jc66a5SBJd/TYlDrk9hFCPX3RbCHZsH65YdpAa5biDKTsLpY6T9fkLYi6uhU
	YMdGmDZsgDdB69nndNrx+rPcXpcB/cuaA3tMAZHD2ya3O42LWWiAkyiIeiMz1nqbiQZUFI8xtJp
	fUSb0yHI9RuDeZ0OkAYBcOPu1s5rxoCw4sAwxX+OLynuUmqEcXbqvIW0fGzaBiYqE3ttvPFj/Ck
	tqoI99AdXJpiVKxOdBRU8c2GZ5Qf6j+YyRI925MCSJVTUYHb97UQHO3Ee0MjtacohF4mAzkW1+n
	cBgfFpthocI3XweWXjdooSkU8D4P4BFsMg71ho9pr0o/ylyhOszExQUuD+VMQjfH2w+KwTRyW+T
	rmLWaZuRnoqOr1MkbK8Fn+xa+J4/e7llXEulY9tuy4LS59QPAEQ/we7Q==
X-Received: by 2002:a05:6a00:929d:b0:848:7a8a:48c4 with SMTP id d2e1a72fcca58-8488971e16cmr11527960b3a.40.1784019577373;
        Tue, 14 Jul 2026 01:59:37 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:3a01:ce86:5400:dbd7:7cc6? ([240e:38b:e68:3a01:ce86:5400:dbd7:7cc6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7da667sm1123598b3a.41.2026.07.14.01.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:59:36 -0700 (PDT)
Message-ID: <e8013001-1adf-4913-a934-e98bed045b51@gmail.com>
Date: Tue, 14 Jul 2026 16:59:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] docs/zh_CN: update rust documentation translations
To: Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Dongliang Mu <dzm91@hust.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Gary Guo <gary@garyguo.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 hust-os-kernel-patches@googlegroups.com
References: <cover.1784000217.git.ben.guo@openatom.club>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <cover.1784000217.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied, thanks!

On 2026/7/14 15:00, Ben Guo wrote:
> Update Chinese translations for the Rust subsystem documentation,
> syncing with the latest upstream changes.
> 
> - quick-start.rst: update distro-specific install instructions, Ubuntu
>    package versions, openSUSE rust-src package, and remove GDB/Binutils note
> - general-information.rst: add no_std section, rustdoc links, abstractions
>    and bindings diagram, Bindings/Abstractions sections, and Kconfig example
> - arch-support.rst: add s390 support note
> - testing.rst: add Kconfig guidance for KUnit test suites
> 
> Changes in v3:
> - Add Reviewed-by from Dongliang Mu
> - Add spaces around "HTML" in general-information.rst
> 
> Changes in v2:
> - Add Reviewed-by from Gary Guo
> - Translate "sound" as "可靠" in general-information.rst
> 
> Ben Guo (4):
>    docs/zh_CN: Update rust/quick-start.rst translation
>    docs/zh_CN: Update rust/general-information.rst translation
>    docs/zh_CN: Update rust/arch-support.rst translation
>    docs/zh_CN: Update rust/testing.rst translation
> 
>   .../translations/zh_CN/rust/arch-support.rst  |  1 +
>   .../zh_CN/rust/general-information.rst        | 82 ++++++++++++++++++-
>   .../translations/zh_CN/rust/quick-start.rst   | 48 +++++------
>   .../translations/zh_CN/rust/testing.rst       |  4 +
>   4 files changed, 103 insertions(+), 32 deletions(-)
> 
> -- 

