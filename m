Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753035;
	b=IVlGNZieye+7wP9QlZ6/R1u5/1jdWJj1MTNXSSSKWm3YP1KPp44MYpw6fHxoV8+A/inK
	 DPJVe3PwT4rEBfxa47SNVQfXqpTSDL280OOYkE4i7H5ffEGCjAdXxBpCx0zRbItg+EYS8
	 GNjO041S7OJme5D5VpRHeFFt8wmQlatcomKsAP9LqDx+uzyIkJ+YMr0UO9yf5FuOhty7p
	 nEpAKoIShaaDmlYsbjD/T6xnMeqCn525seZ3tBeIszN5Tfh7HUZ+BNM7C0R33UpYMO4ta
	 Jw6YNMQOpezCHGUrweFnKaW56FnHdBp/lWSlajUam6JX/FybMj565JzEvM3xwZEtf1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EyfJTg/htaOWoI7HDaUiAyqJ6hW+/dz/pp1CnZqfneQ=;
	b=bOfvlmsRANzIHy8r43CLAxqtnNr3EUsow5LloN/HD/GvvpjKwyMW+XnTNdjpJcZjlJOt
	 9kwEFmrWcSRQFKubHtUbSfYkqziTsbb5L6mJzDCsPE9mFxc5k/OvZOHjt3qNoxaC0A3DR
	 279Dzz5Ho7nqi0o9dh0X8urhsqoSY4Gka2Fbns9e3ZAYjbWvrh2dXK4PtpjtAzPx5XijC
	 OOd5H+dCdOuV+DogrgF4yTu8msGp+A9g2RsV0pbgVXa8C8xvw0Gsn//O7qVsO2RjR5QYf
	 RhtZPc5fntEZZUVdZCmx1wx+1NtnyW6AofhQESZ3A2nc1j/qVGHq5LcFUerBZGc7H6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=h3mcXPHY;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4ED606A335
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 00:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4ED606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=h3mcXPHY
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d06763335aso35669137.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 16:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793753034; x=1794357834; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EyfJTg/htaOWoI7HDaUiAyqJ6hW+/dz/pp1CnZqfneQ=;
        b=h3mcXPHYsHpxwiszFdBIpuE/flz9IDhM/9DaI6EB2pg4YTvSN2tt6Y+NiBMw7P1wN5
         XmWdr5jWVCbMiRNCnZTAoKEm2CmiLvRy6pNTk7JVEnTs0x7ZEfMXq4sbEH6D86Yiz+mh
         qpoqEdrQj5II0uDraGcWQZR4FLH+81f5ac2mYnCvNbMnNjzsUNEWsHnf377qKRybNmqt
         dx6LKR8hMgR/YkJDrsPHhA8cE3AJaTBcqILHFfYrWk49LSamYHGmAA0Lfsvk46aDNL/X
         GPwcD6+x5lznexTmwTdzE+bhFjDEMsC+96fj9/DcgAmMJiIK7C7BmZf5pThgRjBjRocu
         kmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753034; x=1794357834;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyfJTg/htaOWoI7HDaUiAyqJ6hW+/dz/pp1CnZqfneQ=;
        b=0zGnmWjrIxRz4zHvXoI2OuzS/vyHz8HhPAOzrM9SX1Em8f2echu0udSayMKesGU+NP
         MZYpyQA8XTaR3eEeo2ObJVF+Nch906JF8Gk9RVZRrkqTFb3IY4mUlIfG4LZtt6/cjH1o
         xB2JMzbrOe+glfxTVdRItBCjrALDRQ6Z+UCpOs6yf9CUctCUQONXrln7K7oU8nN9k2oZ
         scZ24+kOmhMamRDwO4hcb3VLfHHMA5dxg4IIhZjUazYBGgViYrcL+Kcw8rfFEyERkABL
         i9lH6hwCKhJlSMSWrxUCTz66XOg2StABRM+tEd3lXYjpj6jzKTCOsZS1Yfg7MylCJnGt
         sGpQ==
X-Forwarded-Encrypted: i=1; AKwUvByxxFrDUgHspMNRh5CqLFjwitd6gjHqzqbq6EU7c2Yx7TFa6uxc9JL0DGlAxF/5HzIeQMWVfJFPqmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/adrwXnl3L7DjLZaauJHWA6fcVP/chQ0Wg2juH+tW3oRcrJ1SD
	u1GDzfi5S0E3yXjWDIy1Ei1m9NL6lhyQJ+wTiiOnwnTWOB9NdXushq+dH4ryEdEWpa8=
X-Gm-Gg: AYBFou02+Nc5EyyoHmRQjN7zXK5JtWuJ72mpLnAc79fvY1OrFbI3kPv9qbrQUHiX0ZP
	Puy0xHpcs86bY2GDoJJmJYg8/64A6So6oywdi6sVAiExQ/8oihGvtFJ6obhhM/pw0wZFY0riR1J
	XLV7Q+Q6iaIvlMBqOP7wWrEPxfbeB3PNnj7XBoUX68zrnWS+M6t7zMHzJyKJq2ikp5gdcm/KyLn
	6WbyCCo3WeFcNl6SSfdr6MmTUyOUeJTs+BchvtlTlxaHXJ+j1MYe5/zDAFJDA01OT0cO3KHk8Vc
	4H3Ne34xFTevZhcgPtLFCXBN6nzio5McozaXeSJ13pto3HjakdzUKPI20RIMS4QwReJCFxufm1e
	ZIXsxveDK2nPzOhVrBpwb1v6MDKZ+Ewc3KhAzNqXpGPRvYKOs0ZtMPd28iAY9LBrp2k/73XekpD
	XaXELPlEXGl230Tw0ePV3LlEv65XWNOb48t+NUn+Yv1Ej6PJsFI15+AIwbzXf4Cm1Jyixbou4XD
	cSNRW9ozqd5zVI2SlPoHB00bqO3X66SrvR3Ieq2M+Y9EuC/kLuJ8mz8FSupRTMZtmJnoPYbZeUK
	bOlIh8vZEld+cdB8fLc1jRA7IEJFXbMXfSib0IdB98LfoWQ3gnA0BT5b/ysgbPET+aI1H/4fn0b
	EoHKZfANMsW2p7wLliB2rWEqVyVcUdKaZTKvmnMtgJJrZYw==
X-Received: by 2002:a05:6102:950:b0:7b3:8f0a:f76c with SMTP id ada2fe7eead31-7d072bb3726mr5566509137.13.1793753034167;
        Tue, 03 Nov 2026 16:43:54 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fef4ed3sm527432137.11.2026.11.03.16.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:53 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 08/10] mm/shmem_luo: Allow preserving tmpfs files
 that are still linked
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Christian Brauner <brauner@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261103010216.3447716-9-dmatlack@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-9-dmatlack@google.com>
Date: Tue, 03 Nov 2026 19:43:45 -0500
Message-Id: <179375302574.727293.677909304544098007.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=1h1grQaxg7q4T9eJCUz9ZsqoACadg1b5gQXNPrb1T4s=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq6n/EU+OcPsgUfVgNKKD+WCk3F+OtwPL5xys0P
 a20L7buUNWJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCaup/xAAKCRC7dyhM23N6
 3sphEACiRjymhOf/11oc2wbD8SRoiRXnFKXUYIkVDNP2l3c3tTjP+YijRPjhr/brHhBpu6LOFQc
 qfP6dwNcaAcZx2LZPoXKS+0boalahbWnjrkPNCikh/U6wyunhVlh+urHjZkJwOwmQJ5pfkpLY//
 dy2NLWahrBsKcIQKycF4895PqmSLnx2ztARj+Q8Jr25/ug9GyeTlHFdXnqjMjvuoHAN7ZSVQnXp
 Mnc6QtURb7fjRoNwkBJyiC6zjGlDtqt6MKKQ/CplargM5cyEXQxT8qWPkxk2gglkSlNMfxY3gE3
 6gf0D4WejMbWxcRdueHqdZl+rdZ5nTKsXsqupCnANMS72X30/7lcpRSB/hRl1BpV/3jrhNSqcqA
 ze3csLEhuDcrp/lXRRVYLsDh6Is9PJ6tPDb9T1Knyi/VrMGkTSUC8u2tpROYgkC1/Zoe9jaLkW4
 moEhvwwEAxKDXQ148kswxGlnCaJvzyfWXjJtBEz4c6bSmfLPzjwTEnmC3Sa6qrPvyZwTgCp8snp
 iv3/fx/KILbSbVJG5LO13Pb17QNFYUEp3fo/kzhxB3xJRZ3i18F1v8T9pkbnx1v+CTMTd4+6nAe
 GZs9Ru4nEGOFHIKVBBNu+E0FUeUcaa6a3sBAtbEVawHXo2Ny69+lzr1hTwZzARstZy7A8PKfVmJ
 H2RTjBl+HEU2E5g==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> Allow preserving tmpfs files that are still linked. To preserve any
> file, require permission to write to it and the file to be opened for
> reading, and reject append-only files.
> 
> shmem_luo already accepts any shmem file without links, which includes
> unlinked tmpfs files and files created with O_TMPFILE. Accepting linked
> files means that userspace doesn't have to unlink files to preserve them
> and can keep using them by path until the live update.
> 
> The path of the file isn't preserved. Like other files from tmpfs
> mounts, a linked file is retrieved onto a tmpfs mount chosen by
> userspace, which can then link it at the path it wants.
> 
> While a file is preserved, its size is frozen, so truncating it,
> fallocate() and writes past its end fail with -EPERM. For a linked file,
> this affects everyone who opens the file by its path, so a caller that
> can only read the file, e.g. a world-readable file in /dev/shm, could
> use it to break the owner of the file. So require permission to write to
> the file to preserve it, for all files. Like FS_IOC_ENABLE_VERITY, don't
> require a file opened for writing, so that binaries that are being
> executed can still be preserved through read-only fds. Also don't
> require a writable mount, since preserving a file doesn't write to the
> filesystem. If the size of the file can't change anyway, because it is
> immutable or on a read-only superblock, also let its owner preserve it.
> Don't let others do that, since the size could change again once the
> file is made writable. Like FS_IOC_ENABLE_VERITY, reject append-only
> files, since their writers can only append to them, and freezing their
> size would stop all appends.
> 
> Also like FS_IOC_ENABLE_VERITY, require the file to be opened for
> reading. The retrieved file can be read, so otherwise a caller that can
> only write to a file could preserve it to read its contents.
> 
> Preserving a file also fills its holes, but don't require any permission
> for that. Anyone who can read a tmpfs file can already fill its holes by
> faulting them in through a read-only mapping, also on read-only mounts
> and for immutable files.
> 
> Document the frozen size and the permission requirements.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Link: https://patch.msgid.link/20261103010216.3447716-9-dmatlack@google.com

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

