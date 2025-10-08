Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EA12F49FC
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759913514; cv=none; b=Y4/hW5KGusZngI39U1GvgSzqKo6A8+XsTDvVRNgex2nMLyXiRStz0hlD14OVU+gV75niR3OwHzurzh/04FbIwsBZVTlXlNhzO17OFeAaVxLTcVJLRy6B90fOGI/BoMOE5wgZ+bCtxYVyJnKm4JHvP/nRJxNqWjCOC34XTdcOU3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759913514; c=relaxed/simple;
	bh=K1jLoSzEuFbqSezYfnU5tiO0InkAWReSzsHqNYir2gI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzSFUN3LygC4DJYuuBzbpYDsD6jI5Sz+XJ2gwNGYym/qzgn5fUvuK2puE+eNzHLsGyr/EFgBgZo3mmha3ju5QQGzF9FOGEp7J0cbwWcUfrMBQN12EOmCWQvWQR1AtHaJoeCzf8y01DFswPgnWbBhSME+W96t45kpFHXWNrM+SoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eYrCExUK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eYrCExUK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759913511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K1jLoSzEuFbqSezYfnU5tiO0InkAWReSzsHqNYir2gI=;
	b=eYrCExUKHdGGGxlBZx4q7w/wUeO/Y85AbM4PMugQu72/wNnbzxxVNGJX882evbCSIiY0af
	cMYixdShgWFmr0sU6c4kFrNUKZRNpOy4scO9H5kIoa6iWvz/SMQAjzgbjRGlOwrsVyMI2+
	S/C0rh42jx4Rj8fn2pPqIPOLcSn1cRw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-IQYCLag_PiyqlbeoNe9LIw-1; Wed, 08 Oct 2025 04:51:50 -0400
X-MC-Unique: IQYCLag_PiyqlbeoNe9LIw-1
X-Mimecast-MFC-AGG-ID: IQYCLag_PiyqlbeoNe9LIw_1759913509
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-63049fca047so10591709a12.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 01:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913509; x=1760518309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1jLoSzEuFbqSezYfnU5tiO0InkAWReSzsHqNYir2gI=;
        b=UEzWAyEzBRQkjnYoT/TNZumUrvOoI+p4DrCXb3nb3q8+SzE7kvYYAj92Y360jJV6kJ
         H4snhHQGrielrQBzP9N/wh9T81ybdWkaaHFREcYVOUZVr0Nh/apuT9M5iPTyy49ntP9x
         dXhi0xngD1Wr+OKMX9XqGLDYZijJcbIj6KCjvlnjfMpt92YLH1kenz/rlhdqomgZLMFl
         RB0XpE6LZ1pyfVmZts7jeKyfWjNPZh93n7YL4eNOUqJlFfPnJtTTcx2wmbvqXHa0w0cR
         LyJk7TbcL9f6JxxKNESZbwHI/e8EgZdTJ0GmWYJaZO+iSIpGyGMH+TXAmX/iRFgTX2Pc
         KkiA==
X-Forwarded-Encrypted: i=1; AJvYcCVf07hGVZmo/0FGW0OOnsgUBSl2fFWTLOcawb2xwetIXGQUJRmTOKSDY7mGWqEQrfGUwlB1VZ/oGSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp0g1am2W2mjDQ9CdTt2WkmGePDcdbAnkvzFK0PY0P6NnQr27S
	LfBGl4e5n0kkrKr96hU43r6tmqMT6GqJwf1aSR1Ju+suRH+nFLrj8oiKhDUXnCUx+m0Pxcm3CAQ
	nKw95GFoL+OK1qSYz54ktWIbYeoDmcjBYaYjeoRt6RMzfQXhH8aEUxqTI5sX5gobAJ05BSDxCSy
	70rlhyatBhFGiMI4iSK3sIeAlZ8Rvh+2iNLErt
X-Gm-Gg: ASbGncvIwfyV1Pd4HtS8+n0G8ecKiJemuaaNQwFyTiXq8weTrdekSgS3gqe0kaJJ/H9
	CbrU4kHCSWkO3RX3iMNH6isAF99QFxKLJUOET0I2lWxnU6JkKqWH2OqG6hg915eRmnamffDSXN3
	gLmY6yraDB8n5GjdqtuykZ8OkxLcxT9xcLwrjmbSITt9elJtFjjPynzwt9
X-Received: by 2002:a17:907:6ea9:b0:b0b:f228:25a with SMTP id a640c23a62f3a-b50ac8e5713mr267298166b.64.1759913509013;
        Wed, 08 Oct 2025 01:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlLGykibVDcNGYWtPcRHTDtWzH2pHaHbQcQI7lpz4Me5SQM9O1QhytKqyATgl/LGApHGlZOh3ARmF0O5i6ufo=
X-Received: by 2002:a17:907:6ea9:b0:b0b:f228:25a with SMTP id
 a640c23a62f3a-b50ac8e5713mr267297266b.64.1759913508644; Wed, 08 Oct 2025
 01:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aOUMyGvkibvOV0IS@archie.me> <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-2-krishnagopi487@gmail.com>
In-Reply-To: <20251007185508.40908-2-krishnagopi487@gmail.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Wed, 8 Oct 2025 10:51:37 +0200
X-Gm-Features: AS18NWAa5UqMYPtJx16YwJk94Bme1M1kIPV6ZVpINM7KtV6NNimChhhnPaGzQko
Message-ID: <CAP4=nvTjauRawBPTnGEztZpdDSNhGpgSJtjoTFuq+cCQHP5oEg@mail.gmail.com>
Subject: Re: [PATCH 1/8] Documentation/rtla: rename common_appendix.rst
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: rostedt@goodmis.org, corbet@lwn.net, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com, 
	costa.shul@redhat.com, jkacur@redhat.com, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=BAt 7. 10. 2025 v 20:55 odes=C3=ADlatel Gopi Krishna Menon
<krishnagopi487@gmail.com> napsal:
>
> common_appendix.rst is intended to be included by other rtla documents
> and is not meant to be built as a standalone document.
>
> Rename common_appendix.rst to common_appendix.txt to maintain
> consistency with other common_*.txt files and prevent Sphinx from
> building it as a standalone document. Update all include references
> accordingly.
>
> Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> ---

Thanks for the patches! I completely missed that the refactoring of
the docs broke Sphinx, I only tested RTLA's man page generation when
doing the review...

Could you squash the changes into one patch? See the kernel documentation [=
1]:

"... On the other hand, if you make a single change to numerous files,
group those changes into a single patch. Thus a single logical change
is contained within a single patch."

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
separate-your-changes

Thanks,

Tomas

