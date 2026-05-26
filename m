Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6553D79FF
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788836; cv=none; b=TAkL3ifEbzfqPVZi0Bcjka5i0MVz0xssxe3nJnLPFT02OaYdvLmbFMPzBW9uFqvOFtFr3TU8CAyBK14sE9nNhWFu5daD0vehIgIWzgEgKX8coYDvK3rylNn6uuofs2ye24D372UGHXST5T6SFsu6C/VxgrSdH5WBc4W99sC4Sl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788836; c=relaxed/simple;
	bh=8+nGGSKlUH2wqELDfgHiAT/VMPWJ2mHhPQF2ouWQF0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwBddoO5A0psIZIUOw/mOQnLMUTDl0kcLLA0X/nOznZrkCNIUHc4Mk1k3IsQNkqSehFHUVDm8EbSsUyfxAoKjm7lrlRQYe2F6CXo4ZrDRuBYaY3lsdzcC+wB3CrxC5XbNqjbKS4vwimPB/bjXnWjYlxkvOx00AhA1+1geTROXPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EjQTkHLZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EjQTkHLZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso24585955e9.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779788832; x=1780393632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R17d81rZFtdCmrvPdq6FOwdkUs8CSvLL3BM8+TQqKKA=;
        b=EjQTkHLZWZ8pVUg9gk59c/Y6msmKTq3bu4UiXtP0lNvzAnW1HzNIQOI+8h362r8uOz
         65J1roOpeed/GO/dcNRKF4mcOqiVwLlqNNBvo5kKdzC6J9wILMHJ9BvPhY9ry3PrsA4i
         n4rqddafwx34au/rxzpyxQdfV+/h8Wumnpkqoei2H9VUro489toB9gas7h1XDJkUk8CH
         O+9MN48NZdDBK0b+NhQ0p8I8EarJxSJgpWwmOXqd9qDajMs394MTLqyIaOkGFsYIRRjm
         3rP/59t6+CkpeqFn2g9Jsq3yp1J79p7PG+5nH+WBxj0dEoelXcyuvD+avrfoVM++dNME
         5pWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788832; x=1780393632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R17d81rZFtdCmrvPdq6FOwdkUs8CSvLL3BM8+TQqKKA=;
        b=kLqBC2BxoJ3bcZbwVq1KKmAqLr62zSXRNPZxcGFWrUsGvUoF//Woe2bale0nNFJS4N
         SWq1WJLA01eFr26adsp1HCXl5NWJTro1y7WUrpsnq+gZVADCHRFWJEAiwrjZb5z6WAz/
         uqNszQJ85+EnPWJNeD5YFvNxFeXYsLz7Xvae++fS2ZhuC9NcAN9Xp5TJdLgUMgXbCUJS
         cqcT0FL5WS+Ygedmlhe26xqXWqKQoOPSK258/tXNweeZPM+Ash7b14QfHaK3+k9qxexz
         GRBxs6qt/qG1O5odrpSfZsQAZ6tkNvDK76Z7FwZrdCSxhdFKE6PXF5fMGUGbAv+QDAGB
         Y39Q==
X-Forwarded-Encrypted: i=1; AFNElJ/dcyzDky4PSGrM8SZe1x+E3ey0J9Cig8a+IwCQxGXvCvWv9SGjxfzUBlqBkqyYsp6LoSwf12JSLxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZFhTnms+QiseJhEQr2NL+/KJ24qjtnzTWOL2hhGZqqw/wUNa0
	1YI41WXWX9Js9gco2JuiK8dy19YKFJY3Vi1ZWsQfwvGKdnhZx9QhOYLs1T7Ad6yMrcc=
X-Gm-Gg: Acq92OFJXemhcNgRzzQIAoa3JNyNZt9BkS/7OKTt7EoG4x/XYWSI3kd6e36efYf/xya
	FLs7MxEejFe/0jW32pKbB7LBEqZ/OM2LiGsZwpFAcE5BUwtecNb2j4b4qqYSutTzKX8xnA8vqHh
	YviyppnRxc+EqvwCxykHCPlBYwDguPh1YXz9fVy8f9nfytk1+3jeCswzMZwyy3ZYS0YX2zb683v
	4y3ynXKam2+pmCL42B5NocoWNqoYXcMnyc6P+gNAMHcDovEGI6dFEqQqRZd3oiwWy0KONMmUrNk
	/zLlwFvrmddhB/F7cLewilG48IWbwzvCjOcDBKpkUZxxVFIWfipAv9a8AzLloBmlajB3tQu56OR
	k/9Gqb59UdowoADx1xqEx1EEe67+j0SkXn3/5xyFIMFbp/ks6ZRrs68yaFNZ5W02+6TihxwStHt
	hb81+J05fpdXbkN4grwhQg3i3Df5zLl5BzE6A+YTc3B526GRjfbXi8zny+FwSLagm+ek1ScAB/V
	fU4wmxC65fe7V9Kzc017fG9gUAD4tj4igIFqCdAn8FBazENbINb0ZVVnRAjdGSaqKDStCMBHAsO
	5P+9
X-Received: by 2002:a05:600c:6209:b0:490:601f:d776 with SMTP id 5b1f17b1804b1-490601fd9admr168561055e9.3.1779788832071;
        Tue, 26 May 2026 02:47:12 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm307921735e9.11.2026.05.26.02.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 02:47:11 -0700 (PDT)
Message-ID: <8de0e6ad-987a-4729-bbd0-8399968dbb48@suse.com>
Date: Tue, 26 May 2026 11:47:09 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/14] module: Switch load_info::len to size_t
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
 <20260505-module-hashes-v5-6-e174a5a49fce@weissschuh.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260505-module-hashes-v5-6-e174a5a49fce@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/5/26 11:05 AM, Thomas Weißschuh wrote:
> Switching the types will make some later changes cleaner.

Since the updated version drops the patch "module: Deduplicate signature
extraction", I believe this change is no longer necessary.

> size_t is also the semantically correct type for this field.
> 
> As both 'size_t' and 'unsigned long' are always the same size, this
> should be risk-free.

The module 'len' would now start in init_module() as 'unsigned long',
then change in copy_module_from_user() to size_t, and then back to
'unsigned long' when calling copy_chunked_from_user(). The current code
is more consistent and mostly uses 'unsigned long', matching the syscall
interface.

-- 
Thanks,
Petr
