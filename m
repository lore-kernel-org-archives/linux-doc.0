Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0675389460
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 22:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778971016; cv=none; b=tbUHU0GOo91ru02xbv9SDA/zTJ7DrtvfbPhix6fHZFgqS6emplK10eyvkxxTAGyzq8C9REXfHnwpoBkV7+22ilGTcLRZ/g86JGKZpkwxzo8CwO5KlffppTNQEcznLgzxNkcHDvCTrEk9gEfBF0m+UqMfENGwLKpMKMRofOZ/Nmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778971016; c=relaxed/simple;
	bh=sxq0Fouty+0v+eJA2xuYjtfpnte/cnVjXqImvrRUxIk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ecEeV8E/zwc9djvP8S1e3ZjSGJEL6aZKxSLEo3Iamh5tWsaKr/rwxxJOlNbgZ8EJNURNiuL2DEOtfzs5n9S+ddOZaOq9iRx8THgZ4Nz8sW4G82oeA/7sqLRfz8tyCqCciD/VQCmgS1vy03gM8WvjCf3viDv1dnl18SF7xojZlwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cynoR5E1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cynoR5E1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso5041405e9.3
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 15:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778971013; x=1779575813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sxq0Fouty+0v+eJA2xuYjtfpnte/cnVjXqImvrRUxIk=;
        b=cynoR5E1HeqYCTiD2FRyJb5ircrAUg8/6rvXhgnfMyjfXWo4dbLialEjE02DTbtx1n
         r3O7SqYLoPQAUe88qPo3vvHnhfjeNkw9VrfS6JQvfSf2TAeY3howQIpjtDyb3YzvqGue
         v0DskFIBDiY+17DRdIJ204ISEVIBFL8NRIGXD0v8Uc7Kb+jNgDbZ48LahfpikBJikGQ/
         RoryNL6veBZ8AnrSQp+EMPnn+ZI0ch87jajLgP2FEF8yIBYl5p4CFFiqiEyjFfF10dMb
         lzDupOH03C3dK/3V3TSnXK52QM/qaS8+uEZPaLFCl48h7V7vwJDBjG3d1VthwtkxjnpJ
         SSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778971013; x=1779575813;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxq0Fouty+0v+eJA2xuYjtfpnte/cnVjXqImvrRUxIk=;
        b=TCCBmrh2kjs73Urr4JJ4qia5IS91cW6rWPWoELf6NgG5McfqoX9dD8oQYJCHXCoTZJ
         Fip6iCSB8jLPP01eDOAQYvaXaVwg5p29JLamo1fiO2OlCDaG5QXm6ZJ4CZycP1X2t8Hu
         xiervzeAS/O38WOCEAGhtXj9gCJEEzZrkUdDZpLY7OfkpfXoyWAoA3xSyLxAHfPGRn6U
         a3SE03LZicm/iuwufvu4NVBgqyGWcF7/Mb90rd2sNVXqNt0Epou8SzvcXOmWzB7htQyS
         +tEReTDOH04dgdygGZYzS9LoeHvnmAdy4dfRYr2jws/DzNFScqoUmzYfu2b3SLSwXEcA
         hmWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MfqR9cTYI1t/PkFYJpbTinhj4djc4mP5y70AQjuNelDBVCAQnEinXdmD+x5fF4JopYcdqtZNnCTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiMXh73Ij3jW/0s8g/K5ugxkCI/jEgMCOVvlMRskLomqsiDNaH
	N6FXgYB5pKs8DnIEDhGg5zPF5hjyma7DHW92HGLNKEwECp0R99VLR3Q4
X-Gm-Gg: Acq92OGZQObfzlCbI29ARmIy0heJtjIf2CB5uzsWXUQ2SEIaYVQ3roZ0x2SVtZGzUKg
	81G+K7p4YWJfqCip0lNQjy+ML4BsXeavYkngX7aikczYR65vt6kUI5IWNgADh/AmLAX3UU2cKLl
	6nMjx8aLFtaqwmcoE3xZGlKTACMpSz8D/p8y0cRvd+J8jYM4ESDIq5Kv+7aKdDO9uHgFU8SGhAz
	EkTTcHMC9NPpQYivCqG94KcHeCgw+OxB9a9/MXN+37NG9ZNpFvibGVSRdpwGSPf1PHBrhXmgajO
	JhM/h9b++Q95/EUAnzuOiajc4Vj4NbnH5zmRmbnGJtEspAI6sm84pL/a2qsCQGMypQZlno1ggED
	KxYDhm+2i0aSgIRi7h3yWGDhaEcyvY7z5+kEuJWZupRubICnKbRZN++LIJp82a380vAeXuBwN6Y
	e4N9WAghacsnPwYe1u2Jtf9kYffAvlt/mm1qBjaWzWpHTy30rUDc+ZOps=
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:c3f9 with SMTP id 5b1f17b1804b1-48fe661df4dmr122944235e9.31.1778971013009;
        Sat, 16 May 2026 15:36:53 -0700 (PDT)
Received: from [192.168.0.41] (bl21-200-180.dsl.telepac.pt. [2.82.200.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm25218839f8f.14.2026.05.16.15.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 15:36:52 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2c9f467a-b303-4dc3-83ab-e2a857faec3c@gmail.com>
Date: Sat, 16 May 2026 23:36:50 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [RFC v3 0/3] add kconfirm
To: nathan@kernel.org, nsc@kernel.org
Cc: jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net,
 ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 qingfang.deng@linux.dev, yann.prono@telecomnancy.net, demiobenour@gmail.com,
 ej@inai.de, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260516215354.449807-1-julianbraha@gmail.com>
Content-Language: en-US
In-Reply-To: <20260516215354.449807-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/26 22:53, Julian Braha wrote:

> Dependencies will need to first be downloaded from crates.io by running
> the `cargo vendor` command in scripts/kconfirm/

Ugh, sorry all. I didn't realize that the linux gitignore blocks all dot
files.

So, the scripts/kconfirm/.cargo/config.toml wasn't checked in correctly
due to this.

It should have contained the following:
```
[source.crates-io]
replace-with = "vendored-sources"

[source.vendored-sources]
directory = "vendor"
```

And Nicolas, I think this was why v2 didn't compile for you.

- Julian Braha

