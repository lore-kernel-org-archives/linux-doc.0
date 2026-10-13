Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6909542EE1
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921203; cv=pass; b=J+LhYqyR4wEkKTML91S6l+x40Y8M0Nvpy0AailLGlw6+YMuyhcZCoWwVxVM3qz08kRMyEwCMdeRF02QPX/5E9YTMUxwdFGFlcc8kCk4Ism0Lh1Dm26915fBTTaulLQPKCYwmesBjgazqQ/JBKyLfmn7fo8aY3RNm9y1VHmcztw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921203; c=relaxed/simple;
	bh=kZcNHRKweJx+iHr6GYPUVcEw90YDQL8CUNxb6aSZzLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iML0CJJvork3SRxvQtxknTpyMyRzV28b0lse8PtjEguIu69sn2yZhulZZlUzfd7GknTeY6fae1564qiq+vS7ceMZaELZtVzMshhbGeaJQvi+xlBzHCW9Ps5WbI3fZzNkAJpAIAFVSrpFeeqg6h/t2KPdbSJ8UHRzbgdcMHmPByY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QVGlPl2q; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QVGlPl2q"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5e7834687easo728970e0c.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 12:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791921201; cv=none;
        d=google.com; s=arc-20260327;
        b=loEjXJ5+srBwRQzh7f9091j62awTwMOIj3w1xhDZJfkyeMCUYKN28KC15buPdCf1Yt
         U4Tq1uymM9BbPSnRXNxG+ZNQu50mu+2PTCDQC21Vp8vVj2B69o/iwvPHFHYaKwaHq87Q
         yfsdQzwEYnfIInEibMfUo++LL+hja8585l8pTUSI/n4hm0Uu9OkQcKDX/FiSqVaiXclE
         WVeon2oHgnFqNlWaRXpZGiaupEYDdpIo7k/C2c5pOyBZifEYEEmP+TV5+Ghn/n67/6Tc
         0Yf27g7uLoR15GGyljMQlktUPdMbq5rJvbRRpAKyPIpQH6IpPvm26U+JIX3ihEawHx9H
         Fg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Itq5Kt1Cpx9UyAaFaUspzDtgaSrQMGirNxVH3aVF5nQ=;
        fh=3DvsyIWvMQMtP6mc3tnKuS3Bgi1bFQugdIKvTh4Wer8=;
        b=VofCu0gWanoowByouC0gCsJINVE+VZoySiRmrVzviONf+nmP2qIjUs52lxO20cmOqR
         R48OtKP5c6ywy6ieWDHhV6a6JX9a+L5D7/nVjyqgCVlWJUcxdC8iangghSQ6IyqlK+M9
         /6TP3p6+Olnr7nR5wWhHG0tSeAMGjYBS2ZzoyHVZJpn7xRgqk3+jaszy7c+i+9ikoUSx
         vunSA5+qxzNRvQ9W9az+PTmPaQBXOU+30EzRHfmKB4rldkxQFoDakrCcPb4W7x9th9HN
         DxHc9hlJwo2AqRFH19zzCoYhs4oF6cnhT1mt0dSmOwYGx6XUh0g7WkhGbtmz2nQML4+8
         CGrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791921201; x=1792526001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Itq5Kt1Cpx9UyAaFaUspzDtgaSrQMGirNxVH3aVF5nQ=;
        b=QVGlPl2qfCpHQIJgYmlMoeB3u2b11/EgHKdBkxLXkrqIRszsvgZ+YS1iE/ALMsS5YL
         INUhh1ygHTwoTIY1s3pQUTKlxAUo4Y1Bv6AAeRsigQmYuWgJNuWM4clCnXYDcAtXFg0y
         2lW+5cpfox7mzC5lkBbHhJ5usDndqPbfUa5kZnL9vNSg3+BtacP+QtGjbL68xZNJe24w
         UxYWt8lDGnk+tqtWuDiPkA/BkNRVpev4dJ81iDYcgQiuIazACV51jFpOw0xn4ZDoKkGh
         nCyRZPWB8yNq+LuyVM+KDbaHWto9P86I9CssWfl0xIsugXxwuMSYw9ySa29knrR1zrpD
         kJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921201; x=1792526001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Itq5Kt1Cpx9UyAaFaUspzDtgaSrQMGirNxVH3aVF5nQ=;
        b=fm1bi04GLbNanLfTvfe/jNAj85v3JhkexkbUM+PXBrsNrG7AAYTD82OIF23Z96h3s8
         t8R6TeORvZxO+riVN2fHoUB9fPExyYCUvHAULWP2JKROkeITB2HLlR6kTCUqCQEjLWl8
         EacVSiQFr48JpFtbupJSLXA2FAj0bEJiRqIVXbykmjc6NSSLrag18tdfLUDyRrOsRabf
         95/ig6DiXLeCVZDecC2wmTKHmMYntMZGbk2cschEvysvdpvynkLGEL4MpSDT4+9bZpIq
         +Eak373tXBerc9GmEl1nN7Id2drcv67dWLyXHWcWKaCqTpExAz+hAWT9eswl2LAvHCJ5
         VkNw==
X-Forwarded-Encrypted: i=1; AKwUvByI/cP84CsChXVfTZkQ/hd3uWewdDUq2kOjd8fwYo/p3h4RmZJYFG3Uc9G2b69Q/b9SPi6xfa5fkro=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmMABTWlwausc7QeRAlCtNIAfurHnR4d1nUAsQc0zyjzNwCg8D
	wj44bjI/9rUW7QpT4QLvhe2oDDNxOQ7baO6rIqhgqlR6oBnCk1Y3OvT0OfoEtVGdr/QBNdtj5qL
	I6i1XnEcDCC464e01tbSSgW4S8nRFil0BTElLjDFz
X-Gm-Gg: AYBFou33dHRLeI3sIkwjd9VSFPnMs/mudSvLuWVgQULY3avyfr/pFxF7N6oZ2QMos4f
	jHhJ1AGjiyFI0OVjL1qQlEGwywRijDVQc1PBU4HJ+PoYYlaTaA9lhLcHjubHwm71o+bB2OKYkac
	2Qw3l6p6JOGfCsxecpoiAXilcY0vpsDpZorJyTqDD+jNe7EL2rGUY5W8+nnsQzNdWjQ4KyvvCvX
	Cu6aGSc21NdvQaDt/vgoWhsqngUusbwz3lSaQaaijstt7nUmqO+cvc4S6ddTvQdgPzmihctxA5x
	FjaH4jC1dN4POWXfJIuQXd/EpBjW7yBQRQx0k+1Z3paRF1qLLD3Jl6povGh9b+qjKo/w/beUenm
	iJizOMJXHZA==
X-Received: by 2002:a05:6102:38ce:b0:7c3:3c75:db89 with SMTP id
 ada2fe7eead31-7cb3a117b27mr3126273137.25.1791921199874; Tue, 13 Oct 2026
 12:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-kunit-parallel-v1-0-f4be28c895e5@kernel.org> <20261013-kunit-parallel-v1-6-f4be28c895e5@kernel.org>
In-Reply-To: <20261013-kunit-parallel-v1-6-f4be28c895e5@kernel.org>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 13 Oct 2026 12:53:08 -0700
X-Gm-Features: AclHuK8z2hwcwxCnPzLLSbjbaXHYfi3CL2D7DyPENfay0wYMSMnrgT2M8XDF-Lw
Message-ID: <CAGS_qxrRMoy2fB3zzpD=bOf7R4not5TqpDXE3a-dRKJOpyRt8A@mail.gmail.com>
Subject: Re: [PATCH 6/7] kunit: tool: Serialise output written from multiple threads
To: Mark Brown <broonie@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:52=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Python's text streams are not thread safe. If two threads write to
> sys.stdout at the same time the stream's internal buffer can be
> corrupted, resulting in lost output and runs of NUL bytes or heap
> garbage being written in its place. This isn't an issue currently, but
> will be when we implement support for parallel test execution.
>
> Add a lock to kunit_printer which Printer.print() takes around each

Firstly, thanks for taking on test parallelization!
In March 2022, I'd written a proof of concept that worked, it just
leaked some memory on the C side so I never shared it.
(Instead of using the existing test filter glob, I'd added the ability
to specify arbitrary test indices to run a slice of tests)

I'd have to reacquaint myself with the code to actually review the series.
But one thing that sticks out immediately is, my version had added
this new type to avoid the need for any locking:

+class BufferPrinter(Printer):
+       """Like Printer, but only prints to an in-memory buffer."""
+
+       def __init__(self, parent: Printer):
+               """Creates a new printer that inherits parent's
settings (use_color)."""
+               buf =3D io.StringIO()
+               super().__init__(buf)
+               self._use_color =3D parent._use_color
+
+               self._parent =3D parent
+               self._buf =3D buf
+
+       def close(self):
+               """Prints the contents to the parent printer and frees
memory."""
+               self._parent.print(self._buf.getvalue().rstrip('\n'))
+               self._buf.close()
+

It required passing along kunit_printer.Printer objects to more
functions, but I think it might be a cleaner end result.
By explicitly calling `close()`, we could control when exactly output
gets flushed so we can avoid weird interleaving.
It seems in a later patch, you write each kernel's output to a file to
get the same effect, but an object like this could be used in more
places.
Thoughts?

-Daniel
