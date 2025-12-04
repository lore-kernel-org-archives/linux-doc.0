Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ADC3090F7
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 06:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764830230; cv=none; b=FG0NhPUakUoHAMLtbqoQ9SI1oa/LuUR4xP4usT1+S2ctKUg4IZlqAaAaPP95DhRhLHpeFv4/xdYoiJeKXv5BiGCtpee4HHVCoJUechxXL7+MXMIeVRcm1iNAzAA28H2Jzc/defKIAGWbLdT8Z5GR5nFQ7gNgtl5WPFzWZ+dfAog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764830230; c=relaxed/simple;
	bh=rlvpXp4vXIUjCAdr/hHyOvzOZjcIFPmn9CfhMS22lG4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sjd7R5Vsf/Hj4USwuLN+EvHqvDxYpEia/X+Lq7IH+92YA+JsnAa3wIOqCNmh9UVCTV4qS/AB+8lum0ibAuuPhHIaDDlo5VydxFhAQlZTwbzaj0J55jUf/b5C864ZDPJe5qXw+9WnDlil4zKxXbHOyTLcfcCZa5niYdpcTDew3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gPQgZfcY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jZE404U2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gPQgZfcY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jZE404U2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764830228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rlvpXp4vXIUjCAdr/hHyOvzOZjcIFPmn9CfhMS22lG4=;
	b=gPQgZfcYaYD4b2dn3wY0BVr/qOXU0Wj4GopgwDNK4BSKS9Wbkt5LSGDHw9WCyGqwWpPNu8
	DQSqomhqRTBTEFbHpYmQeGy/dO20bN/Tq3El25Ue5mEbeV6YsTFzMpnCjgoVGD3+IZMEkm
	p+D12kErEp2/gLgGZGneI73fb5VENmU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-R9kA34qEP5G9yKgknm9ENw-1; Thu, 04 Dec 2025 01:37:01 -0500
X-MC-Unique: R9kA34qEP5G9yKgknm9ENw-1
X-Mimecast-MFC-AGG-ID: R9kA34qEP5G9yKgknm9ENw_1764830220
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42b5556d80bso391496f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 22:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764830220; x=1765435020; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rlvpXp4vXIUjCAdr/hHyOvzOZjcIFPmn9CfhMS22lG4=;
        b=jZE404U2wHKrMJWBSQgikKmkLv7iTzt7a9T+PEnOXKbWvhVNRm86hV4+WN/FhMux0c
         YjdpnAlKaEpj4jMsULkirBNP8qqRaR4R+36qeBnBSGO/oRIGwHtRczxAg1UtDhRKhala
         bP+l1dF75C+UFquIzba33YJK8M+YBS5I5XTHRAjtQ1A1usZv82BlLjgNT1RQ402jXA/5
         UIrKwHZvjZqwaM1hx1tLn9JoEWNhApkPu64uARGJ5coBF/FfPY62UvQM9F5WN3JXf7ll
         S6NHtFH7yNOeOCJT9WSlIY3sx2mgKjV+0ZjJRWlZwgpxpwrI3bXD5lY+CzqmsTPbqvls
         quXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764830220; x=1765435020;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rlvpXp4vXIUjCAdr/hHyOvzOZjcIFPmn9CfhMS22lG4=;
        b=YO0ZUu14c39UNRiL9ZRjDfaDs9kcX6TTm/W4v1U3FEIkeTwNGv4x8S8lElPWvWYjIi
         dlAN1RdiLyg7w58xIsuJ749mqn7JFBp9qgxGM7NodLWBm1aQ3w6aa80qNlhlHGhaBD68
         iyj4f75xeiP2kMt1kaVNyI4f+h28UMna3T578KdEPsBcbefKoDpFjImmMFWtP6Zh81eI
         aySOiripcWDopGwGMWUpi/AB+GWnk3YYpOKmpRdPA5AEiIlmt8Ol8awdoy5wkxH4IWU5
         vXZDRl3e+c0iwmKSw3p71v3yRDxNinwUciLD3p7s6nx5hcj2UK85YbqePpk6kNkdkJ4k
         3Tfw==
X-Forwarded-Encrypted: i=1; AJvYcCWnViAa2tABYIl0Ad8CgGBjlYDCsZoj2u0hRPDdp4Pol1B974M56Zn7crw2tr+uLAIdVQgDVeTvom0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlTqRc5e4EyhdG6fWXr/fCtQWBVbc+LC0tVlCxbf3JentWfmpc
	Aq4Vk3O0HeUsFsMdJFwW5sFKMnQUiY7u5FdgP/qg/8hCFc2C7CtJLSG+gw1x+N1yKIM1+vNPm/e
	c/IeMRdtzsM2f8HBsslgSTxzNS3yMFuEUVd0HaK/penBBh+J1oQDsWgSBeZZhEw==
X-Gm-Gg: ASbGncsPHotSe25XcJNL337SS1SzOPT1hICi8GjpC8SStMNOL81YEMZujChs+Xu3Eoe
	Rdm6W8XIEKKeeni9BBxQk0DlyCYVg+4QH4FqoT+LY0z1WGzNMceVZrSLPg2bkfF1QNGFK/JlX8r
	bDSNb5smUbjenT7JV2m1mvzPgrt+7rNw/ZN1OJu3mO6e8wjlC13OTe6CCkdoX9bwPao2TeTiI9g
	y3ql7e+mIrZU/sdJHZQ9VQKRypAOTbXD5jKSR1HHKD11V3DXaVh/yvavan+CX89oicOsIDn7l/c
	ABEE4ERSQVDcKb08bbee1wkZJXGSTZuXGETgh9DBnv0WomV058gO6MVneisH2nNCSEiDUOI5EzU
	DpUfCQ2G/vSP1Ta8dVit9ajWS/enu1qcaxv8=
X-Received: by 2002:a5d:5846:0:b0:429:8daa:c6b4 with SMTP id ffacd0b85a97d-42f797fdfccmr1428233f8f.21.1764830220212;
        Wed, 03 Dec 2025 22:37:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVv89Dh0h6k8CSTD9tgFWXKJrlyWPOh6eQ1WXkpbNGabqnJgqBAuEpWofqbE43M3jSFyUU6A==
X-Received: by 2002:a5d:5846:0:b0:429:8daa:c6b4 with SMTP id ffacd0b85a97d-42f797fdfccmr1428210f8f.21.1764830219788;
        Wed, 03 Dec 2025 22:36:59 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeae9sm1381076f8f.13.2025.12.03.22.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:36:59 -0800 (PST)
Message-ID: <a34546391cc59f9f880ec271292ac201292bac61.camel@redhat.com>
Subject: Re: [PATCH v3] Documentation/rv: Fix dead link to
 monitor_synthesis.rst
From: Gabriele Monaco <gmonaco@redhat.com>
To: Soham Metha <sohammetha01@gmail.com>, 
	linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org, rostedt@goodmis.org, 
	namcao@linutronix.de, mathieu.desnoyers@efficios.com, mhiramat@kernel.org, 
	bagasdotme@gmail.com, linux-kernel@vger.kernel.org, Jonathan Corbet	
 <corbet@lwn.net>, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Thu, 04 Dec 2025 07:36:57 +0100
In-Reply-To: <20251204032452.9523-1-sohammetha01@gmail.com>
References: <20251204032452.9523-1-sohammetha01@gmail.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-12-04 at 08:54 +0530, Soham Metha wrote:
> The file 'da_monitor_synthesis.rst' was renamed to 'monitor_synthesis.rst=
' in
> commit f40a7c06020709
> ("Documentation/rv: Prepare monitor synthesis document for LTL inclusion"=
).
>=20
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Thanks for catching this!

> ---
> Changelog:
> v3:
> - use a 14 character commit hash
> - unwrap Code Blocks so that the references can be linked

You may want to add this to the commit message next time, you are in fact n=
ot
only fixing the broken link.
Since the change is small I wouldn't bother this time, though.

> v2:
> - Use proper commit SHA reference syntax

I suggest you run your patches through script/checkpatch.pl (in the kernel
tree), it's usually finding this kind of formatting issues and even more be=
fore
you even send it.
On a side note, apparently it wouldn't have worked this time since you quot=
ed
the hash.

Anyway looks good to me.

Acked-by: Gabriele Monaco <gmonaco@redhat.com>

Thanks,

Gabriele

>=20
> =C2=A0Documentation/trace/rv/da_monitor_instrumentation.rst | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst
> b/Documentation/trace/rv/da_monitor_instrumentation.rst
> index 6c67c7b57811..9eff38a4ad1f 100644
> --- a/Documentation/trace/rv/da_monitor_instrumentation.rst
> +++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
> @@ -162,10 +162,10 @@ For example, from the wip sample model::
> =C2=A0
> =C2=A0The probes then need to be detached at the disable phase.
> =C2=A0
> -[1] The wip model is presented in::
> +[1] The wip model is presented in:
> =C2=A0
> =C2=A0=C2=A0 Documentation/trace/rv/deterministic_automata.rst
> =C2=A0
> -The wip monitor is presented in::
> +The wip monitor is presented in:
> =C2=A0
> -=C2=A0 Documentation/trace/rv/da_monitor_synthesis.rst
> +=C2=A0 Documentation/trace/rv/monitor_synthesis.rst

