Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD0B2FD1D5
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758718498; cv=none; b=Ad7CneXSGnS6NXa6zv6UabvMVUinpillmWUtV24VsG4WGpmIztXwKnUuBI1lN2tCrrGwgLBfhQ7mTPd+Hr8MfamaYt8wA9B2ddUoP1lh3AVHAbuXyUvhkVM8bt9dOB5zejBycuypFTVheMefsKJ+pw6fs/L70+bw2o1K6txbzpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758718498; c=relaxed/simple;
	bh=/h+BV5SZD7obtHJsFz12bUq2UapBcOsDzpiy6TIVFrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJ+m9r5eF6jwwAB2LzcRflEUO4pun0Dw0LYyaj7yJEAyCIPpP+6DMlpVznIyf+oasahBoGltsfaMvQHd/aHE69Xp0uVKFt+vUNkPbT6ZpTmErfNa/5VmTC9qqwZ/RGnFr0s0mxphGcYE1sMecnU87IlVfpd6dzI4aDqoQNFwGdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty8rWSqm; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty8rWSqm"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f22902b46so4318462b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 05:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758718496; x=1759323296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xZjHL9JfxozniuHLv+c05c9n0ugGpAkyMCt7s6XaE3Y=;
        b=Ty8rWSqmdgH3p2FB09aux6lR/zhKkTDN0pfiMI0kcyDD3jDqQP/nUOQ4GxwXIVpiVY
         MjanAjFb/dZwXYlCpyTemxFIf2LWQ6SlfvGRb0f9eDlecEvmfiqnVP8t6ZsXWuR/dtli
         zZwGJpo3QYUNJ4iYPefwe8ryyV/5/5+hSCNj6bpqL4FOUDRGbvh04GG8Vr/SOkFAaFc5
         kZdpXWSYCFDOEdWpksWGssrJF17K0oi0B1V7y26O5roiAOEAS76iJwv0tgGaPr84uH7u
         SazWpeYQAT8XrggM2dgKQXDk3Ff1RkZIXWKvAvehtv+ukhhlN7N8jaY98/F4/T/Y7xDL
         vFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758718496; x=1759323296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZjHL9JfxozniuHLv+c05c9n0ugGpAkyMCt7s6XaE3Y=;
        b=uE9WkmqBjm5hmUUAPImUDTgD1QBLDXE7SCOMy1bIBDCeX/THBdIDue3bN2ReYewX3H
         8g+EXE4yIt8hYZdEWJPBBGo1hmwU0ewMV4hvFZcSw2uYWTExIWEi5EWVfnqdXDwx0nQw
         HsLYfXJKoAz8WnRP0KBsA34I0JtxgzkZHKpxqdIwc1ywIQjP2iq5OmloHfaFmwpvI1eL
         UsVk1tQHfN6AU++b6z8BwiEPrsxvBbErgO7+fP4+hESvEdMSQWQHPqSem82zSJ7GcdHZ
         9ShonJcgQ89CtOEQ+v1aesGrCN+SRsKag/KiX+CMd+h8vE2Nd7VIl3haWpeNCYUC7N3M
         n2kA==
X-Forwarded-Encrypted: i=1; AJvYcCXQlhRyYnA4eXEiIf5Rq6kKcv7NiLpXkirb5wwd4rtsi+0plwxksrtgKptcRUpu+W/BGtDXr6/N04Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79yBsjhQOmfDbec+dqS1wOvP1N5rZbtv5N3M1yfSnb+zoJ4xV
	ttODI9pHz2anSGO6ye/m001ZPd8S8WqGd3Mmq4BKOYXW1FYm495Zhkon
X-Gm-Gg: ASbGncvj5q+MrMSazHcGjz+geOdO743borGJzP5nGe69dGhQvIICvi/DF59sBbYwIGr
	xNpCF0UvXakVJsimSsN2sCF3xLkI1SzFZvGEGq/fn2Fe5DOwxYmstZg36aO5JtFR4hpXuu25apx
	vlDWWYfb6ok+44igJXvKlVrgXVrrD58mZ4koBZvK6tRxFbHrRYy05OqeMVF2iT4JqUq/LpcBZn6
	6Lw3uQlGFIjlC0leiduZrumO0WoHH0YXwv1aLdSg8oVm6E0H+cme3EPLcJp/EGr2PDpV8dyGtKv
	HCoKIc6r1BI8hd3SmwtHsGwbjZXUGzgR5ab4u5/2lhalUQE64eFSzuTO4JPzyrVD4+o+u/W09i4
	Xmi/tDyQAYTX2o3vdd6mxfUFNqcxL4g==
X-Google-Smtp-Source: AGHT+IGyGR44p/+wkNNs71UbKfXtXoZY6CV/4Rk+INIgJ/j15iDcF/I+YEMWdZ3PmvfPa1HYYhTQ8A==
X-Received: by 2002:a05:6a00:998:b0:770:73ed:e6e8 with SMTP id d2e1a72fcca58-77f53a7a63emr7216256b3a.22.1758718496302;
        Wed, 24 Sep 2025 05:54:56 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-780fc88c823sm13374b3a.54.2025.09.24.05.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 05:54:55 -0700 (PDT)
Message-ID: <5cbca9f9-b8f5-467b-8602-3e0c927348ab@gmail.com>
Date: Wed, 24 Sep 2025 19:54:47 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Documentation: gfs2: Consolidate GFS2 docs into its
 own subdirectory
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux GFS2 <gfs2@lists.linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>,
 Miklos Szeredi <mszeredi@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, James Morse <james.morse@arm.com>,
 Bernd Schubert <bschubert@ddn.com>, Chen Linxuan
 <chenlinxuan@uniontech.com>, Matthew Wilcox <willy@infradead.org>
References: <20250911004416.8663-2-bagasdotme@gmail.com>
 <aNJ9yJ7XT4Pnsl9E@archie.me>
 <CAHc6FU7aGJZZzN8zhtnwDgXX9gVMh_fbi+sUpJ7tg1MWMa8XVA@mail.gmail.com>
 <aNMnSapfyfwga0Oz@archie.me>
 <CAHc6FU69a-R-u-Cr90aQMjb_75SChUa9BTSjL4AZKjuo_QVJQw@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAHc6FU69a-R-u-Cr90aQMjb_75SChUa9BTSjL4AZKjuo_QVJQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/25 19:17, Andreas Gruenbacher wrote:
> On Wed, Sep 24, 2025 at 1:03 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>> OK, I will resend after 6.18-rc1 is out.
> 
> I have added the patch to branch for-later. There is no need to resend.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara
