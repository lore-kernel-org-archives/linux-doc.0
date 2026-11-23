Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422299;
	b=wIYVltFc3ty25ImprXchkw4XfiKDw1/4l1xuAvKppz15Xx/tQgNzOKo4UCEYGlN+8JgB
	 ubY4p31iDN4n09PpKVMqMSI6hqZFFLj9fhFwtcXerIfGlpf0Rd5injhZO2ks08Ifu0MJs
	 PqbN78wxHfi6YKIcNNrtbNK4FhfMJIKgEJ+X3eLcMJ0uoKMWRiiO/4Ec4Ngr6BD9JyGbV
	 tRU+KmCKuU6K97oflhsiO6bPgoFSEMbm4+Sz6xwI3kClg/9oScN1/TsvsPZUh4Thsl53j
	 EkqMaW8gbSH/ZqGZWP+Lmcq6mUS8wCj8ceQxZRx1P7QSeTiwaB0a6dUayHCpXByLbaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422299;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=0tki+M1BefXqILboQVq61NA/8ZpvcacjXKbcQqfpqGA=;
	b=bkx4ZDxnvW6ewSNCF4GC4q9nSTgg6DqItv8nHPtn5SIR6jTL020Vl2h7zGwqAriF0dDn
	 b6Wuwwl+HMagwUJuXLpwxFAg5MwOQge+cvHe7+7JBrMq/sWaE7l/sZkIJtkE2Wk2GgbNR
	 cQwpfE9/Zz2KAI4Ayc/VgTMFm5eW8g+8C5Pc0D5Ro3Ptgl1mvoenO9oYUmOgqZKSeeHC0
	 j8E+6EyNcOgLWbro6emFkiQbnBsNHxgyXPGRS+vaxv9oTPOeMQXtcDBiwRh9b/w9xdiXK
	 IVDjJoefjLyAsxHRUPH709dRzq30MJCGXcT4IdhaVFErKIrIyZKzl9DdMhSDRlu9uyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EoJX3YA7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JKm592IV;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5C8606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 08:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E5C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EoJX3YA7;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JKm592IV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795422297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0tki+M1BefXqILboQVq61NA/8ZpvcacjXKbcQqfpqGA=;
	b=EoJX3YA78otZc5wIcbEVNNbpv3o5HV5drVX3ZXalqgCIgCIFvFWBg5JP2bU9VZS0pshry1
	rZ2kGZhhiiYd9SfVrbyxH4WIc9fVxZqTyPsuLnnFdcD7FBs3o4ne+aiByQ0Qu04NYbIvft
	VTW2AAXhTDV23u4A5CrSe/hvzQhkUjA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-fkN4gS42POiX18ZdZvtYlQ-1; Mon, 23 Nov 2026 08:24:55 +0000
X-MC-Unique: fkN4gS42POiX18ZdZvtYlQ-1
X-Mimecast-MFC-AGG-ID: fkN4gS42POiX18ZdZvtYlQ_1795422294
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49febef74e3so27605105e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 00:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795422294; x=1796027094; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tki+M1BefXqILboQVq61NA/8ZpvcacjXKbcQqfpqGA=;
        b=JKm592IVuIIStbbRN5l8NYNOwxReYLe5XgKccAxt0cHVtdUQmzyuppxCX5rNdAPDXK
         Atz/+NoU31p7VCLfQshHilVBLrkH9YfSZ5D1qriVZTcf2krSpn9XGr6TDCbBJqRWax8/
         XvyZyeCD7aZ8kgbrnOOQzESER+Rp7NCW/mGQpLOScsRwyE2VfDuDSIoanQPKU6CvsHcQ
         XuhltDq2f2DmTugumb/R3Y7jGoQYOG0n4vdcAwuCGwnLeDXFerKoodt81s9FKZmCMUX2
         MVOnhoJAhXU9Dqw9gGNkG5oFnIYW41kpLwaPqoPsyVolXOC//CY8s/oYOTCzRf30joZX
         uS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795422294; x=1796027094;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0tki+M1BefXqILboQVq61NA/8ZpvcacjXKbcQqfpqGA=;
        b=vIgGJ7MoFIHG13ZBloJO2wml0F43CeoUnVN8YEx8OpVmsey0nr8j9m0NevomkCZa4Q
         vzjwFHm7aIb94JR0y9SwWppgClhVnwvxiQ1RMH/CdpMzoPWwYoVCxYYw7Erb9pv/SVsC
         KAyJ+sBqelaqLA5Zc9Xc85hw6i0WVnaTXLcVzuzHhw1vRYKPM1bSa6uY8jW7aEF//lrE
         NkMun+N3jyIvzEj36U1a9zuRWLtULqSRIiJn4TSn+iZhyu0yeqcGvSfcoNSvet7RJnhd
         GyvyE7PQIRo35CFOBaYm75Lw6dm2CYvxHao1kh57Uj6x1gepd4I+ssNH3oCtL2EAmNSw
         RccQ==
X-Forwarded-Encrypted: i=1; AL+hErHwkmxdD9ZCvpYZI7mZ12bqoOmOYyNmjheMuusOfceXphRzAcpOAhw/lDCvsZIWPCEomYrqMQ5eBT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Wjq/w/2qdikaz1Tx9VAFmQwtJ07cYHiiIUQfTrAnxxY5h7eu
	kYspU4atc4EnaycdZK7m4GcrwLy/PwTWKKwXiHB8vNQd4WlxBBKGBLfQJef/w7iyElbpXaLbyQ9
	bGugbtK9cRq+zjpBroRgqYOcl3gCOZYDJqX0Utcf9ia+DFvJXbvPLf8cIGFwJnQ==
X-Gm-Gg: AZFdTZfMhQEux/ZSgHovUcE6rLZ4eO+emMghE/RgBmbMNplyxQEBdDjKSFNnBpT3LRY
	9RTeTitjsbFT/pvQQ0ea7INoe4pxDMuA9mf5D8hygvz9+XaziAhoy0vXEbM0yHBS+v3ZAVwrYgQ
	s5bmxBn5/cQZJI6b2JBxZah+6Tk6bLPWnYocgGl/u08OGTRKo7Y4Q52dtCQAwbSLmo+YCEOukJj
	JS7BTafCXtuurrhn0j14mF7IM9hbyRDcDLB2o0myDlIdPtmheNQCG4qlf4AkY7wI/+1njwRxg0l
	5NymCIefmzNgUCgJxkW3uE5nKvayTXFxkXMuTWwVi10ZeptqXM2pmjPHE+6jCKGITEYFcm+NbLH
	SJeR/ZI8Ws16fp25uKmYPYlVfqK2FtV54e0LrToqIENjS4wTleS1RH3zRX0dOJHFG5JGkE2xxQ/
	fv
X-Received: by 2002:a05:600c:a39d:b0:4bb:679b:fc6 with SMTP id 5b1f17b1804b1-4bb86157a2bmr176756145e9.12.1795422294369;
        Mon, 23 Nov 2026 00:24:54 -0800 (PST)
X-Received: by 2002:a05:600c:a39d:b0:4bb:679b:fc6 with SMTP id 5b1f17b1804b1-4bb86157a2bmr176755785e9.12.1795422293941;
        Mon, 23 Nov 2026 00:24:53 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm21170713f8f.3.2026.11.23.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:24:53 -0800 (PST)
Message-ID: <7b5bbd08396e7478b68c941f1f20e111a1623869.camel@redhat.com>
Subject: Re: [PATCH 5/6] tools/rv: Parse the mixed enable state of containers
From: Gabriele Monaco <gmonaco@redhat.com>
To: Wei Li <liwei1412@hotmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	 <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Nam Cao <namcao@linutronix.de>
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	liwei391@huawei.com
Date: Mon, 23 Nov 2026 09:24:51 +0100
In-Reply-To: <CY8PR19MB700974075298C61A1DB70C3EB7682@CY8PR19MB7009.namprd19.prod.outlook.com>
References: 
	<CY8PR19MB70098BF493A3B67418C7B9ABB7682@CY8PR19MB7009.namprd19.prod.outlook.com>
	 <CY8PR19MB700974075298C61A1DB70C3EB7682@CY8PR19MB7009.namprd19.prod.outlook.com>
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
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-04 at 17:21 +0800, Wei Li wrote:
> From: Wei Li <liwei391@huawei.com>
...

> --- a/tools/verification/rv/src/in_kernel.c
> +++ b/tools/verification/rv/src/in_kernel.c
> @@ -29,21 +29,38 @@ static char *config_reactor;
> =C2=A0 *
> =C2=A0 * __does not log errors.
> =C2=A0 *
> - * Returns the current status, or -1 if the monitor does not exist,
> - * __hence not logging errors.
> + * Returns 0 if disabled, 1 if enabled, 2 if a container with children
> + * in mixed states, or -1 if the monitor does not exist, __hence not
> + * logging errors.

Instead of documenting the meaning of integers, why don't you copy the
enum here too?
It doesn't necessarily need to match (that is, obviously use the same,
but if it ever diverges, nothing is going to happen). I think it gets
more readable.

> =C2=A0 */
> =C2=A0static int __ikm_read_enable(char *monitor_name)
> =C2=A0{
> =C2=A0=09char path[MAX_PATH];
> -=09long long enabled;
> -=09int retval;
> +=09char *buffer;
> +=09int enabled;
> =C2=A0
> =C2=A0=09snprintf(path, MAX_PATH, "rv/monitors/%s/enable", monitor_name);
> =C2=A0
> -=09retval =3D tracefs_instance_file_read_number(NULL, path, &enabled);
> -=09if (retval < 0)
> +=09buffer =3D tracefs_instance_file_read(NULL, path, NULL);
> +=09if (!buffer)
> =C2=A0=09=09return -1;
> =C2=A0
> +=09switch (buffer[0]) {
> +=09case '0':
> +=09=09enabled =3D 0;
> +=09=09break;
> +=09case '1':
> +=09=09enabled =3D 1;
> +=09=09break;
> +=09case 'X':
> +=09=09enabled =3D 2;
> +=09=09break;
> +=09default:
> +=09=09enabled =3D -1;
> +=09}
> +
> +=09free(buffer);
> +
> =C2=A0=09return enabled;
> =C2=A0}
> =C2=A0
> @@ -370,7 +387,8 @@ int ikm_list_monitors(char *container)
> =C2=A0=09=09=09list_monitor =3D 1;
> =C2=A0=09=09=09printf("%s%-*s %s %s\n", indent ? " - " : "",
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 indent ? MAX_DA_NAME_=
LEN - 3 :
> MAX_DA_NAME_LEN,
> -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ikm.name, ikm.desc, ikm.en=
abled ? "[ON]" :
> "[OFF]");
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ikm.name, ikm.desc,
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ikm.enabled =3D=3D 2 ? "[M=
IX]" : ikm.enabled ?
> "[ON]" : "[OFF]");

This double ternary operator needs parentheses, otherwise we are relying
on some non-trivial operator precedence rules.

Thanks,
Gabriele

