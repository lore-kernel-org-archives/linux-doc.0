Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B839F33C19F
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 18:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106390; cv=pass; b=XWoFlAjrLtN8IORUBjlfpzi/X5ASKedzwcfqwsQyAgTheMcmlFNfXMBRvsnJtD5VsxdUAqZI9oxzaWnkeEwDHF1kAzU51ek0PhHcPYE3ipLa6y03F/lhFlxMjjO0DiMWupsRMv7Whb/k+nx9FCLIrLI+uHCnFiDpmwmMDHD+PB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106390; c=relaxed/simple;
	bh=w9r8EjZfu+6WBBNKHZIudTdElM7NIcXhyZ7Jt0sf0KQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0QmDBPSSek/WY3JUjCOBeqWvzUqMsNdA4jA2ymttNWjuKqcbOtu0womS4H5QWr6PJxUzsdR6h7G4KjW9F+PrLJwmtoIAlotj0OLXTZ/QY4Bn/Ee0tlHwygxMQrSB9qyoWwxvnqEyOHVIX6JJHrUttXC22KCht47r4Vo3vBHrKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=MDYLS3N2; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="MDYLS3N2"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65807a2012fso2152900a12.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 10:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769106369; cv=none;
        d=google.com; s=arc-20240605;
        b=JiQZadVkMXN58DSyT3iAdqSNyD/eIUuM9+h9fQtlHmC9WK8rnXq/hJxT+FPeuR2oHl
         MFAH2NAbkIE+h9PJbfKmOpuKyCkmqcnwTBdWw6CgA9reK9KpOlKvB8NRLh+xeaafvQLt
         mfH23/122HKu4AP0WBjMYoTJWBGTkNe/qAS794PmcvPhhSDZkARh6Y1sUuvqabwzTRU0
         2nl+AyLZjgqcw2FVKw15j2dUNSFMqRr+g1U9Agq7XMYjgkSBOfQ5sIn8Xgt8O0QH6igS
         rrV2/TYKOn/GGYcZq6T9Y3iqvGReVoNQQPobOykLW31pa3VnEYnOFzXv/JTyAhuFsWUs
         zJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w9r8EjZfu+6WBBNKHZIudTdElM7NIcXhyZ7Jt0sf0KQ=;
        fh=yAWc8HyCZRw7gjqBS8PppcOVg3vyGzYCe/W3AUiUmvU=;
        b=RJjiCKTpDurp89AEs2SVuo2ECIl0GlFVIeBeZYTZ3BqBFiTWcxgoJJouXsyJa2L+XI
         oGRkkcbE0v73NdlAUKovDpa7jGgRWMM58mkq8OuWQySKHRU7d0mHGYG6M8Kx8ENN93d1
         s2zKV0Hbfth9bF/EdsZljF14K7awN+ojaPf/Ir5mA+WUkTPY+oHJ6zfiO0MAASzTRchu
         7Pc0NjC4RCJkniH+deqREOGOP19szLFUIkdaS69VXGtUcSAKJhfguJuAhz2bV4CukdcG
         /YfbdowKhZVJc0qH2DZVw2KuY17uBgQgXBfX8m70DzDpNgHECJNn/1xSpIXE6uwVMYZW
         lbtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1769106369; x=1769711169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9r8EjZfu+6WBBNKHZIudTdElM7NIcXhyZ7Jt0sf0KQ=;
        b=MDYLS3N2M5hleC9gYxfGhbgGwODVxjxIlNtC+dODoLosCY7NDiWBlhJpDQv8MY8J5T
         /x8z7gp4kE0QUaTgc5/VuR4LVfgehxm7fSKoQ4BAytcn4Y9t42ZmRgMLGRwAeBow9IzL
         9erbHZalcemDP7qO3ADaXvTc4j2f4Ij2hr4yy/85OoNdzhEhefEo5HtVnfXU0QXaIlbD
         wbIL1CO4apjWdC480ktOZIphXFILNjkJVyLwKg0sKj3jb45bTngVJdq4KMdBLxZmlZc6
         mBA+/BmUQRMajmcrCg9iC8vdfqRHTE6SzQ7KeIPkqVGCyCWeLVn2hBV/SANSZ1YLh51l
         lnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769106369; x=1769711169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w9r8EjZfu+6WBBNKHZIudTdElM7NIcXhyZ7Jt0sf0KQ=;
        b=w538XowFg60gUeiAw3sQjblR54anjVmWvudW6uztdNiUpLhgae5Sl+3usM4Uqv3LvC
         32fBChL/8HvTuINJXkTWKEpxbUgZxsrY9qSfEh+oJn9wWZ/ERNXTt8SGdKVoprWPPKu7
         pf6xf54zbyAbcSkNCv0LQJD2s5FDLGW1e+T16Er6G2f8RO5W5j7udNybzXhJsVsBa4dU
         GLVpRWVDX5iX6GEnHSudUfidG6jHofb0bS7Wg2n9AkCftuL6Au2X/QxgFwVh6KhnyLsL
         yPPoBtA45rhwJGaymUxAkOi6MHKs/3Uz3iYl7Gx/JXUnkESEPI5uPijtEVY7YW4n41J/
         1orA==
X-Forwarded-Encrypted: i=1; AJvYcCWlaWrMCj+CqMdR2Q4E1jEgmOvciLDvsSk62+Wj53OrAsJYBLdUuqStAOI7Q5/B/wbRVDJ4IE2mfhU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ItEWAUOu/dsaIAlWeqYrD0CuoBm9X0bhHjxzcu0ln2IV/sxu
	wNbRIvdV/+x5CRGikXnHlfP3xPZYK/4cFXey1c6yg7nBL4dwUVH1NwfS+hyEV2jhxapoITnyqVd
	23MDRpL/AnhUKjTDTmfTp3NoZ/k7eU/wMxFwCFafasQ==
X-Gm-Gg: AZuq6aLfofIlBEYlz5NF/igO9bFxFmE/51gyUZJNRJSoUId3Xeuxig+mbRHfI2EBVRf
	0ZkYin4Ahr/HURhgKzjVso7RhC0t2uoNWYPcxYueN0OHL7ILUZBE6fJeCkq5KI1jDwCxF2aojs3
	HYXFBzQz0bM1wBgCZHAQrQLiXLLs7+NhDv70I8HbNIpTEFhaafd5Hes4/JurnoBkAzg7O+anY4a
	AxmMoEBc2hRcuT50MNmT4AXafBnslUNPl6tRO2P7w8Q+lvD0VTOxZiX+cJ8eF6eEltJDm1zSxCn
	0mGT38kvzZo3il9xW7hFl9Ew4A==
X-Received: by 2002:a05:6402:2745:b0:658:3c7b:5c3f with SMTP id
 4fb4d7f45d1cf-6584876232bmr343669a12.11.1769106368921; Thu, 22 Jan 2026
 10:26:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105165839.285270-1-rppt@kernel.org> <20260105165839.285270-7-rppt@kernel.org>
In-Reply-To: <20260105165839.285270-7-rppt@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 22 Jan 2026 13:25:32 -0500
X-Gm-Features: AZwV_QiXDdGmSgod4IzeC1v1Mi9Wmeos0iKetVDkwL8LXL1nrc7MhMPUl8727d0
Message-ID: <CA+CK2bBu=ThSf1nsrMWO6ij1cLB_TNrEK0dCCc8+kC-MtAXstQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] kho/abi: add memblock ABI header
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Jason Miu <jasonmiu@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 11:59=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Introduce KHO ABI header describing preservation ABI for memblock's
> reserve_mem regions and link the relevant documentation to KHO docs.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
