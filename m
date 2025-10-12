Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00744C85
	for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 04:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760243975; cv=none; b=VOZjwmzbqiQA22BQtJPjFx6QEPssapQhknbDLY/vFTTn5/AjqAfzR/ABsXN6grZXnCfIAiFwhZ3oZEaYS3QRd4gE9y5LEkfQtZMHyCiSLpjTCzxFOaMfYjZfv3zDmjhTrKRj90/VGm+KbDTzsIvd5sDxhSnmiJDAU3FlrKzAqT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760243975; c=relaxed/simple;
	bh=i0NB8VPs9WNZNzuJ91iOWkqGkMr0ANpgHpdXj94FyrE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=XXy7e4wpi8LuMOF8pTA6tJWsjH9S/JjNuQJG90FXbcTqEDXvzL11fEpGBKETvyRcv4SIbE32gJwZbL3jm0G93bzmExoFUs2V/+yRzsHeHzuvAOCuSh5UZcXgFUeoZecXW3YX0DchsN6+F9JyvlKKAAdbWBUXJyVKnYx49+X0EyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5DuDNMC; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5DuDNMC"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-781206cce18so3322895b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 11 Oct 2025 21:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760243973; x=1760848773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DUhac950eRxdyyx3HiUQwDUj821eiw/vdCCJuggJU0=;
        b=e5DuDNMCCMH/2mZW42cr1nemGHTE3vP+kakvBtP9NhsY89GoPWUSQa2L9NtPtmzbNh
         mVJmT3X7LTJDw+QQoQDm65OtsWJg2FsBITvLERbx/+sqY5a4VgpFf2qc3wPxELvsZSbN
         HpQmlFvrhG86BscEZFJneqtjpgE61GvEFhue8JqntGx75/amZU3ed3Co19mEtCoiXWyD
         6PWIyH09Xctw66YKeg31HpKpZ3zNED9GAK5+JNSFrwdwoVBgI0eQaF8X5hP1GE1czMj4
         xivzZ0epCVOOFDdSxr+nLCJLTUKaPUG85euphRx0mf2jYSSVTPBvShCNVUrYK5JKfhnu
         XcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760243973; x=1760848773;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+DUhac950eRxdyyx3HiUQwDUj821eiw/vdCCJuggJU0=;
        b=VCs07McvKYBhvqF8js484cmQSSvVzOvxNydlDnoac2TqNPM/n2AYbtkAt1qLonVed8
         EH6SfMyjlNjfPf04AJuIzV0HSqWBjVWw4WTTR/dcGoWCIf04MK4n0VTCPMjc+pVLoe8b
         9wijNhe9SPnDnImOxVpjG7KU9wL2K8ylWZHFFIdRgUcL/632msdENOXZmKZZDEp1qyZ6
         g4mlo0i2gP9ug/34nl19ye0JtJ+NyPULhAfXoTmMopqiZK/NBUur31+D7D2loMZuq7YW
         lxy1xukZ6h+BsMn7fd62cm4rHqjU8U8QCzfCHvrcYoU5iIhmWIe8TTB+VqXclJRIjg7m
         +ulw==
X-Forwarded-Encrypted: i=1; AJvYcCUesmbErwrggtgJSLSAr4qH+M3hCHgAsyMarSfmHGPA4aP+0V2E0F9evVptFvX7kuiBWLWo89OO3IM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0iv3m4XYsoR5IjUqtJ5EpEuDfpH7WpihQgCC22lb7z/yxNZ9L
	zFTl1KgBbSh/HyW5t+0O7j6BvwS513oGXCal8GYSNjYhnoLDrIbB/IJj
X-Gm-Gg: ASbGncsLzIRZ+6Acz3wacpg2qOcUxS3ac5sQtopzhLnrj34Zma1yBDV+pp4GTt1Bl2s
	AwnM88C8pogBYKQdtOEfv8D74ymLicaPNQ0EjCCdiwJ8hvhhGLEiHatW1/Yv49kKvvH8VSAp91g
	7mTsDFVgEmnmavE5OZKULNxV9NlkWUEgr7iCQRDg8Lf5IHEertvJ+r3sSVzUBG4R10K57I58b5+
	N+0XMFqHk6RGcIbjJYBxHHXEtI/Vun2PuIBb7Bjys3B6j/KfyU6Bu01R3yLtJ22EWNhWaQBnH6O
	Njdz0P0N6NznKgqBz6GY1Qv7I1XislgyrrYoAGHfIHMQsVn4vS0D3HGDi6QzvxovDOlbeAfENgv
	zirCgaGBbMm3dvwrhvOMksO3NszUTlID30D+xGvOJjbwvQUsNCo3pdKbVQ/8HowSCeb9AhJeTRY
	0yyWKCcsj8ubs=
X-Google-Smtp-Source: AGHT+IEVrJIqHvqdRDlLJG5jsbGyIWUy4NaEqCqD107094NHNTnFue4xGwAElpPMyo9ce8seoro+QQ==
X-Received: by 2002:a05:6a00:1701:b0:78c:a3a6:a1bf with SMTP id d2e1a72fcca58-79397b19445mr19301172b3a.7.1760243972914;
        Sat, 11 Oct 2025 21:39:32 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b639cbcsm7453159b3a.18.2025.10.11.21.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 21:39:32 -0700 (PDT)
Message-ID: <12aa7858-b05b-415f-a76b-c18848a9a784@gmail.com>
Date: Sun, 12 Oct 2025 13:39:28 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: nogunix@gmail.com
Cc: chao@kernel.org, corbet@lwn.net, jaegeuk@kernel.org,
 linux-doc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <20251011172415.114599-1-nogunix@gmail.com>
Subject: Re: [PATCH] Documentation: f2fs: wrap tables in literal code blocks
 to fix LaTeX build
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251011172415.114599-1-nogunix@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On Sun, 12 Oct 2025 02:24:15 +0900, Masaharu Noguchi wrote:
> Sphinx LaTeX builder fails with the following error:
> 
>   Markup is unsupported in LaTeX:
>   filesystems/f2fs:: longtable does not support nesting a table.
> 
> Wrap the ASCII tables in literal code blocks so that they are rendered
> as code instead of interpreted as tables. This fixes pdfdocs build
> failure.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>

With this patch applied,
"make SPHINXDIRS=filesystems htmldocs" emits following new warnings (Sphinx 8.2.3):

-------- -------- -------- -------- -------- -------- -------- --------
<srctree>/Documentation/filesystems/f2fs.rst:307: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]
<srctree>/Documentation/filesystems/f2fs.rst:308: ERROR: Malformed table.
No bottom table border found.

=========      =========== [docutils]
<srctree>/Documentation/filesystems/f2fs.rst:309: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
<srctree>/Documentation/filesystems/f2fs.rst:310: ERROR: Unexpected indentation. [docutils]
<srctree>/Documentation/filesystems/f2fs.rst:311: ERROR: Malformed table.
No bottom table border found.

=========      =========== [docutils]
-------- -------- -------- -------- -------- -------- -------- --------

That said, for your info, in-development Sphinx 8.3.0 (not yet released)
has a lot of improvements in its latex builder including support of these
nested tables [1].

So, I think one option for you might be to wait Sphinx 8.3.0 without
these changes.

One caveat is that docutils 0.22.x is not fully compatible with the latex
builder at the moment.  If you'd like to test Sphinx 8.3.0, you need to
say "docutils<0.22" in pip install.

[1]: https://www.sphinx-doc.org/en/master/changes/index.html#release-8-3-0-in-development

Hope this helps,
Akira

