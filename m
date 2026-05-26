Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E693F7865
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801294; cv=none; b=DTHZYKhfQTH0tvVyXnO4rhiEqHuU6hDWSqT97c93/yjv8P9FjJ9HnBrQsj1RgYyxcfmY+Q/Rv2kMiwIILEOHIfAV5xL0AZJz+SSec3VEjW+dfGVXkLsoFpmenWYBzIHQGsJ1Q0+UAhFI6WusUijLE9SDQJN9AQrRKK2sBoftUYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801294; c=relaxed/simple;
	bh=/+TDbtQdoXZLR15lIobccDcb+fb9SD6eVXuxnbR2M98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bStz0Ta2Ns6FD7A7Sl4zi8XZkuvSXfWNrRcxRqbE1vWICIb6Wohlcnx5yM8GWfolQkIC/vda+AUA5h+MIjB7iAg7CBAp7Am6zpt8w67sPw9FM/bpNFzoepjm9za7QI422oPt/oA6ichJl2MLieyA/NY2IJZwMCaKq/6UuXiJXOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WgInIwyk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WgInIwyk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so55571075e9.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779801290; x=1780406090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P15uXtg9HdllBQIu/ZsCrfbcDnCOaC1HB3obrbgjmNc=;
        b=WgInIwykVVoaGAUgaZcwBgPb2XaDQMvOOS2HFW9/o0cQ0HUO1ZApKEHQ8RW4TtLo7Q
         P0mg/PO6DDRxxTinG9zEP4hYMAMIYBNCHzD2gC9d4XHrk533aUfTsOUTxQ2cT77UpFzy
         7WI917lhsD43I1Zvr1pMY+XEkFOvYej7aY4h2sc1In8bxj5qJnjlQTbeSV+whjwcW8L3
         rl4d80CAUdQZmrA25YMNaSrUK3qshiAwA1BJCR4uxhTmL5xmDiKmWxnta6B6HjsCkV6Y
         nrrS/j/5mHD2Ug5dyQvXBvTz6pC9OMDa7i/iry8dzDHSmtWjgBoG+UCFGAFxHKmGuQV5
         K/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801290; x=1780406090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P15uXtg9HdllBQIu/ZsCrfbcDnCOaC1HB3obrbgjmNc=;
        b=Fs5RQy9hChX4+uXm1v+wA1hCYgKAkgH9PyHeGbkUzRAHd/CFjM0jvBZrhQ5MRgNUDL
         jBVTWzpBc8EGIqiYm4ufvHGBJltu0UARzj9i7A2KQvaQ7qmuua/ItlmgwvoN2xczRrvo
         JtuMoXHVSVdkY02TKn2CX8crzTLLum8IX524pmsiLardmMNMzLyKWc/Vs2q2p0gesfAr
         6SSHaW68bFSk5nHks/hGwF0OzA7zMTNBLYPJamsPlpriUntjpr3kcvPh1LR+xrMrIikh
         MMWW9v2XgH2iBTzvFk08LYb5Ypv4GopcpwD+zeuRz7AXluuxDa1zVwWOlA2qaRFU8K+F
         TIJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+U4jLa52yqT38eFmFJeQtstMIlVs2fFJxIH9iOXxsa+/2VB+0a3slNKaROlGysAtn9jinc5+mfA9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxowwnSDq2e73w6KmiQxtcngsYMVdxXLbB4lPqQRgRQDx40jfpT
	Goiuov4un0J1fqQxjrD6+cwkkgKJ4TI/m9XD0crSkXRx/oIt+0pT7hP2Yz/WGmYZehA=
X-Gm-Gg: Acq92OFq3wOciowCT4tWo4axKeptipFn/EnYIfiLPrFpVznx1CRfzobcnt7vweaLVCE
	3PqLcSUHzrnfWYalxwdxv2BYyW5oklS/BzzfAH2XU75T2g+uMfwunCFrx8Mhk5gj/1J1eiu4m9R
	cITT7sSCSMS7PTVY8YBvCKHCaa+HfV4BYeKH7+/iy0LfmwS0IRCSPIt8XjP8Qt/9jR99QRfgfex
	nhf59dJ+oTaSf6reY86oh6EbkE72enCESIhVcrFebb247rEjRCmem2vqK/Q1flfRR3t+6s2qRwM
	hO1DnRcYBq43xNGpzusLzRiskllXNgE+KCQsm0ez26eqYD/Qcm3UytX8U5XWQd6DV5eLz4hqD0+
	RCtmV6L6dYpm3uJ0X031D1lc9xvJMTrUME7za5hUDpPlc4cg1i/9PT6jCgFqbOpYGB+Ks/oh3RJ
	MCmBP5Fzg98TydrfXXtnaUx2gOBZF+1Wh35JpzGNV/KGdB
X-Received: by 2002:a05:600c:4f91:b0:490:6e12:5418 with SMTP id 5b1f17b1804b1-4906e12552emr91630705e9.23.1779801289895;
        Tue, 26 May 2026 06:14:49 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm34868452f8f.5.2026.05.26.06.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 06:14:49 -0700 (PDT)
Message-ID: <a050130e-d354-411a-bfcd-afcfde4cafdc@suse.com>
Date: Tue, 26 May 2026 15:14:47 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/14] module: Prepare for additional module
 authentication mechanisms
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Xiu Jianfeng <xiujianfeng@huawei.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?=
 <f.gruenbichler@proxmox.com>, Arnout Engelen <arnout@bzzt.net>,
 Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>,
 Christian Heusel <christian@heusel.eu>, =?UTF-8?Q?C=C3=A2ju_Mihai-Drosi?=
 <mcaju95@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org,
 debian-kernel@lists.debian.org
References: <20260505-module-hashes-v5-0-e174a5a49fce@weissschuh.net>
 <20260505-module-hashes-v5-10-e174a5a49fce@weissschuh.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260505-module-hashes-v5-10-e174a5a49fce@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/5/26 11:05 AM, Thomas Weißschuh wrote:
> Reorganize the code to make it easier to add the new hash-based module
> authentication.
> 
> Also drop the now unnecessary stub for module_sig_check().
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
