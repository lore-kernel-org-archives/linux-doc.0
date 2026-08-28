Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9B63431F5
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787938549; cv=pass; b=rtKEwQtplXzj6UJapebtrRkHUF+v4/mv3xlScII8Bna9DmlgofkyTiUvV30kH0a61TDSyx5RkoiQ3oPFOHnEj4q9QGLBpXo0eud0b0Av3wkx8xR+H89G855DmMwNcwdMgx99eks08KyUV7z2tXvLNe6fkdsdZCaMsSYxFZ0ZBqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787938549; c=relaxed/simple;
	bh=QIwfG51FYqLbuC6hjumlOSKKDDgtiZ/qEfd/e4ujq2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7rTu2KDJIMicX78CeOC/HxOeStZXxdumx3tGSl6rU8HYk1IrSc9RlpZEQhhs3CV46t6Hg40Y2Fd341cLlLAhE6kOknIA4b7u/Hwgt7kAUFjQOLGmu3nnKcr3Ufo6ElMwqpOlcqIVrgE1ZXvzsj1VoKuqtLtR4k+IZL9EwE2z+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJbBMiqf; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJbBMiqf"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbe4592c193so193194a12.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 10:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787938547; cv=none;
        d=google.com; s=arc-20260327;
        b=M9ZBKqHU6k4XA4aU6w5fJqx9FZNchIZw3AlYqth1Ndir+sO+nxJQ2J0U6zeI8sOTn2
         hqZPi9o/iPiLS3u0Si+Eb3CLUVsd7mjcArNbZyEB/ZHMnJzSocBNzCIobZ0lnuA37E1W
         qfeK9O7db9/bk2PvNTHpxdpYKaUaWGsAsQGTvcuq8qdQaCXWW+Va0IfP5i01WdAS52eY
         3IWxcdUkrE1r7RZBHna+8fH9KpTDT7OYMsUhjITeA+C+i4cp1hyGnAFH30E+J+E/t1yg
         zhO80Y9C3xm0dUM3cNIP0u6AP1U8Vh62oqm6HHijfsxYTqLN67m2O2GP+2geLZ7sV2bU
         euUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        fh=qEiQZ2c6Db7BKukvuXg2VU96iO0p9QlnbxPX12TLhQs=;
        b=m++C5vlYOTHZZQiNR0ZgKoR2ELUDE1imOkHaysW8qOnwLdcVZUlkJe8BmFKHxEX5x2
         n57WDihfKAWnhKdDwTVHOmiTHW3xYoRGHX9Yf7kzlJPZAHO7dNHpkB/fQqhEr2bifTNa
         4O9FYPNZ3toTXXyeEqE/dTzvtFi8wuKhHGt6UQ6KY6pvZOF1PCYnzBuPkDZUMKmjloDn
         YvOWcqOlRVnQWlnrVJS+NlY3N5clCaBTJr5YMHTVoSMJ7L/PbRq45fjH5Kw3LtGpkze6
         m7UEnB9fJpvqn7u1bwCwUX7MVRPONusf50cexTRAYCzmuYEkOXi0erf7txHru0vBuWz+
         HQaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787938547; x=1788543347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        b=cJbBMiqfnfAzijPJg52XSJhSdf6VBAoIXgQABBtFTXeL9RWB1Otgdfb53SbhWsdc/y
         8zL9XSz8jn+XcKsCDxmpUzB2J0s1aubLdWKgF79Ise6dKeevXJKQaWls37MweKlfuGmd
         gIlU7fZcHXoM+CQbeY/sRY5ah8e79mCRpUjoFtfe3kjiIhG6s0b30vPleJUSLoty/jrM
         YyDikunxgsG23Iuwt7jTR/k4cjWh11mCnPkcZ2Mkv1R0CdEyfXCaGdmzoQwAXK7UU5a6
         XLVxkQbLoc4IOfFq+rM0yupntWHQubwwPKJ9jFiNbQAPw6/AiwZpTzewPMaAxvFrg6GE
         HIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787938547; x=1788543347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        b=KVtNNThXKHSd3qt5MQG7vk2Xl4ShbZblYe4IGJP3ArFZiSQz7XXGNGfXZ8nEV14uhl
         wOSpWJi5egjalM+3zTq7u1qTMYlIluZCvBFXyG73y8Oy2FF3wMoDP8Owt1wf+B1nqb5K
         l7HU/bwrHi/Q40S5uZd3Vq5lc2OEIjj0Kcd8FFMOB5n2Yl/Sgb3yCeYvUWMcCho98kbf
         1BCl5UGQTdbzTzRQAGXmoMoojrypSov7QcCN8AdqIpmP86k8/zaCJoxCSFWC+ArvBb3G
         vwqwsT3/IzaA0NoTwhRQxOoRdFVIP22d1cptdyg4fg8p9drTYjYTxWS1v28pkIrrTVIF
         +mTA==
X-Forwarded-Encrypted: i=1; AKwUvBxzEU6RIjKJ9zIVh3hISnka1gIWterRUzhRHzX/lsnCBWiFSPHvSze5YCD0z5NVUCAK3Z51YvGKnhA=@vger.kernel.org
X-Gm-Message-State: AFuF++lSZWapWGqEIlvrA9Mxa8ugzYDxxisv27BSYMTklkck3RSr9env
	YMiTm5yd5lcL7lG1wLSdRJ774n7Exj6IuZllj/Pz2a2Hk2qgBIhUs4C6GFdbqoDtkESsd9isbF1
	wNoalANFxLTLZ0W8PsdT1jcbkpDRrF+o=
X-Gm-Gg: AYBFou1CfE2zt83Kg4G7wayMSfH8f/t9uL27jOuNvi59sQ8nH44RDGrXBF+9d7z4odC
	Wzhw3+CBlX74MmFpi8Tsv3reMXvdwn1SJ9yVfoNRCkSZOfQRhQajtx+4NtgbeN4XRd0/iW1cbnV
	sOoITyT+ueZZ6C3KcXzMKxz5DzlDIRUVaGQVP9+yHsymnAjxl2MARRBW7u5zXqcAqCu4R13XLxk
	tywoipZJ/08uGLsrfCRDZroiQ1s9fF88uEqkRcEuMCxAPVNWQkYs5gjVHX1ultghiQFGXAKWbZq
	PFothib9OOilUF+2fJLCte2PyLyuR2g+DCk50+WcZG/4pWpHbyOPaId9sX4MBVABWXPGp4vOrTG
	H+sz6AI7qaKOHGJhrtD0YQRPbdvyruQLUsIP8PizGrRVUvcHndD4ELZZqF6QkG7+JOZWO9Mw=
X-Received: by 2002:a17:90b:3c0e:b0:395:4df3:8800 with SMTP id
 98e67ed59e1d1-396d0c0ab29mr8371730a91.0.1787938547204; Fri, 28 Aug 2026
 10:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
In-Reply-To: <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 19:35:33 +0200
X-Gm-Features: AcwNN1WSwsVhEEVM3LRdqRtFMmDIpvaVESiQMW1HL_Bvm7itPlqfdlYEKO7mGmE
Message-ID: <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:25=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> It states Python 3.9 which was already older than the 3.10 minimum
> set when the container tool was merged.  Also my understanding is
> that it's not a hard requirement for all the kernel tools, only for
> building and producing a functioning kernel.  If I misunderstood this

I didn't check at the moment, but at least back when the "(optional)"
tag was removed, it was only required for certain configurations from
what I understand (I am not sure why the tag was removed).

In any case, it is nice if we could just say that it is required -- it
is quite useful to have around, especially due to its standard
library.

And regarding the minimum version, it would be nice to eventually have
a single minimum for all Python scripts, no? Debian oldstable is
already at 3.11, so I think we could perhaps bump the minimum already.
And Debian stable is 3.13, which from your list would be enough for
everything on your list, right? So we could perhaps set that as the
actual minimum for everything in the future.

Cheers,
Miguel
