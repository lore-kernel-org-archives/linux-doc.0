Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551607;
	b=omJQHuFxHIJxOlt0YYW2tUAenjUABZFtpHG/dXPNRg74/067Pr/T70yLwyn8QzEZxLZT
	 Jn8dtT2r8NXm2ReTIK8VcLILIiroaim/jBKr1j0fLO2ppsp1Yab8p/bZlJigkyCYcEzBz
	 j6nwYoOvZ95EPqbvdF0HujZt5Lwj9zkfnjWY1OkSsuKLXkptBr5I0EkBQvxkiz+s84++L
	 KspS1b6W1klxJOSAC/CDxgDBAptKnYDOI7TnoEHDp5kIE+B48TYO5prZxXs7Q/ZLwT1sy
	 LP6G959p/AbOOQEYkjuRxF0vY9y4/2XMnkki7LS9Wm5vXWE1i3YX4t3WAJlqt76+8MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551607;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=2UOEeglIq2wjqfVjHLbkqGo040r9HVmD0tfnoKWHBLE=;
	b=sRHBoAPsyWccAUTx1iz7CBhRWprw5wLlqI8p++IaUYs+jSpWQOFuYfWv0VLraS29mbSv
	 TmxAjNzHIj/qCgb1HoADlDi5omvLlXQ3afYeAdWRv2zFmYN5h7WOlhUnhdkVh8RcBmylU
	 LwtnBQ9GV8yRNhHp9uI5j7FNlzYdAd/1H9MWRm+bdDsoQ7LkKw/1cjz0XVS7QaMF6nXBH
	 e7KdFYApl4HYVCo51AjJ7g9YP99XqlWX9rWf0BhN4LnwbEqm+5TcJv5LmJSblyps669rC
	 IED7IAe/qOhhm4v6wuZAY33zOR8SLLYGScQBrWGRtLNtO6lmcZDhCVInXZdSrnMStlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NWBBf3vo;
	arc=none smtp.remote-ip=209.85.214.229
Received: from mail-pl1-f229.google.com (mail-pl1-f229.google.com [209.85.214.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD1606A32E
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 06:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BCD1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NWBBf3vo
Received: by mail-pl1-f229.google.com with SMTP id d9443c01a7336-2e9eb579c0eso3405955ad.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 22:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551606; x=1795156406;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UOEeglIq2wjqfVjHLbkqGo040r9HVmD0tfnoKWHBLE=;
        b=1u283pYnU1wD6RBE4a/mMMgFLNQNfqcFxd46P/tRp6idXCzU1UHqXRYj98W6nke+eC
         jg68yNHj3w24WmIePvJHRQMT3OFTCzEKYYFC2vohKASw2mm9iMv9peyc/AVQWDQvvnuS
         hFBP5BxYJBwroppezp3iZngbYhXhK5mV6UGI+J0jRxAM8Q7N9emt+9XU8Mr1Juw9dde0
         +Nkcn26RXlT418HaGYJy3AvXXJN5BqzE2GyHHc70sNrS9Z2sGVyXuWSxEJ9Ir+m0SxUM
         35i3G04xMvY09dbb8sq7cos4l5zc6VpCAW1dYKm3GRc9MtkV8c5KzXnVFPBrQF1oAWIH
         rIZA==
X-Forwarded-Encrypted: i=1; AL+hErENr1OS0SVQO3F++uxOVCZVU6fLhq6ci0tZZNtd6TLbYRMvPHwsWWsKrP/tgCMbogBmfqezlqwvFYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dCPxmGPK9DCPtjMDhG/F58X3cBFkWIrR26C88iwpnVq2Ghvb8
	BQzElZtYI/1zd1TWI6RcmAnudLymaP4BA5Jvv4Ew+PJQcNNg5ri2q/YWsuGaVjVvHsYOfi0f21C
	aRGu+z/ETrRzyY5KwCI2zYwOJF8Q4rSi/n3Qmwc6l/0n9S8mNjJC6KnUf/vkDb/gugEmFXKaO5X
	gpSFnn6oYRN0DPaRP7TzEo4UeaP/6FbfAM8W0fiV/xc5MtVyu6rFuVfznqwoMPscnKExttIdIek
	9qMmVQjhqK9Slg=
X-Gm-Gg: AYBFou1unOCJfCNGymQ6xgkewxcNZE9szBjY0whRiEeqtaMbr5YEz6pCiBuiEcuq3QQ
	20T086OojgnNEm4q1Bnb5y2m6ae/9+5lF/RUBVZsBWb5aNfz/LIsuo5SVetjL+uUhoG6A4ZtvmV
	MpFZ558nIj7vK77ODlmUpvS3ublqX7dPGDQOfkY7HFkm2Bmy2rYzaGuVJAGMLgPgcVuL7XAc0jg
	APLavfbFU5teg2d6Jp84je5JP4sVSr8Ryl8nBiYb9tn9RojFT6M5zZUDmqsdFAabpwZzW5LH6SO
	TS2hh8by1lGcNVCrH+LLO3nKyiX9Tjm65PNfKnfBZJDZ3n5oSv7vLGHsLLt33UWjODHwiPOiqHR
	+wm2n+whe1cq6o21EZV6+iGcgYXUTnzLJ9zSWmEa28KJIciPTVngEjISSooAf9RcLb7WkVPG9Ji
	quZgqZkft/TfwXUW5sWsoH3q+vOv8ZBqsc
X-Received: by 2002:a17:903:26ce:b0:2e8:1c7b:3b6e with SMTP id d9443c01a7336-2ee0dac3bfcmr15496845ad.26.1794551606391;
        Thu, 12 Nov 2026 22:33:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ee0fa6fe8bsm656165ad.56.2026.11.12.22.33.25
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:33:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3ab25af70b5so2530771fa.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 22:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794551604; x=1795156404; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UOEeglIq2wjqfVjHLbkqGo040r9HVmD0tfnoKWHBLE=;
        b=NWBBf3vofwb/s5qignJpDfE5mZrh8PjNNRH9mCaPSfnsxfF02dOPRQMiXaP/hmW/q/
         qf/dS+xMaUDjj4rj/XpdP9YJTqiy7AAhX2IzqKwm0R1u3VoUr/3X4O7z5Hq5+ZFT6jXx
         K+ranA6CnK4kWy3uK7KtmjacmHLpJ6XpHuNqE=
X-Forwarded-Encrypted: i=1; AL+hErEczdySSDiYI/wE+/eCSNUvgxbGP/qDCyyRji1AFt48i2ffrNB22csrRE9uF9Z7dtGcCs/AvIO/uBw=@vger.kernel.org
X-Received: by 2002:a05:651c:1544:b0:3a8:380c:9fb6 with SMTP id 38308e7fff4ca-3ae2b6aaccemr5737201fa.28.1794551603947;
        Thu, 12 Nov 2026 22:33:23 -0800 (PST)
X-Received: by 2002:a05:651c:1544:b0:3a8:380c:9fb6 with SMTP id
 38308e7fff4ca-3ae2b6aaccemr5737051fa.28.1794551603524; Thu, 12 Nov 2026
 22:33:23 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
 <876c4f4fc442116c9bff8abd8c34f99fcfa65531.camel@infradead.org>
 <CABQX2QNd7DehBsH-pGL=EJK4b5vC60PymL_YP27xDxGT6_6=uQ@mail.gmail.com> <1bae109338ab6ff1ff14eac811f7e86ced785b22.camel@infradead.org>
In-Reply-To: <1bae109338ab6ff1ff14eac811f7e86ced785b22.camel@infradead.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 13 Nov 2026 01:33:11 -0500
X-Gm-Features: AclHuK_X2h_Z65J7PRPJKNTU3WeHZRshjbv0gFpjJkCKiKkj9Z3jKMBYT-rFpjY
Message-ID: <CABQX2QNhRZP1Td_HQ6QpMzw-_TjqhbooipWYg3VTgTOq2_U9+w@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] KVM: x86: Forward VMware hypercalls to userspace
To: David Woodhouse <dwmw2@infradead.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Paul Durrant <paul@xen.org>, 
	Xin Li <xin@zytor.com>, Francesco Lavra <flavra@baylibre.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e7b1140660229ac4"

--000000000000e7b1140660229ac4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 11:56=E2=80=AFPM David Woodhouse <dwmw2@infradead.o=
rg> wrote:
>
> On Thu, 2026-11-12 at 20:05 -0500, Zack Rusin wrote:
> >
> > > And I wonder if the cleaner answer in both cases is just to give
> > > userspace a way to cancel the pending hypercall completion and use
> > > KVM_SET_VCPU_EVENTS instead of piling all this stuff into the hcall
> > > structs? It could even just be a KVM_VCPUEVENT_ flag to make it cance=
l
> > > the hypercall completion?
> >
> > I agree that this would be cleaner, and if KVM grows such a flag,
> > VMware userspace could use it too.  But it's new API in
> > KVM_SET_VCPU_EVENTS, and we'd need to agree which completions it may
> > cancel: simply clearing the callback leaves pending I/O state behind
> > for PIO and MMIO, and KVM_EXIT_HYPERCALL also covers TDX completions
> > with different semantics.  So I'd rather not make this series depend
> > on it because it significantly increases its scope.
>
> I won't necessarily defend my suggestion above to the hilt on its
> technical merit, but I'll observe that as a counter-argument, yours
> *really* isn't a good one. We don't design a userspace ABI based on the
> fact that we're impatient.

I think that's a misreading of my concern: it wasn't impatience but
coupling the VMware series to a new cross-cutting semantic in
KVM_SET_VCPU_EVENTS.  The current approach is self-contained.  The
exception fields were already in v2; Sean's only comment on that
struct was to move it into the x86 UAPI header.

> To your concern, I actually think we could get away with aborting *any*
> pending complete_userspace_io callback.

I'm not sure about that. I think simply dropping a PIO or MMIO
completion can leave pio.count or mmio_needed set, triggering WARNs in
KVM_RUN. Retrying an MMIO read can replay device side effects, while
dropping a split-write completion can abandon remaining fragments.
Also afaict for SEV-ES/SNP and TDX, KVM can't simply replay the
guest's VMGEXIT/TDCALL: RIP has already advanced.  Dropping the
completion can lose returned data or leave a multi-step request such
as SNP PSC unfinished.

> Userspace *already* needed to
> know about those=C2=B9 because it can't migrate while those are pending;
> it has to do at least one more run, even if it's with the immediate_exit
> flag set.

True, but, again afaict, that rule exists because those completions
have to run, so I don't think it tells us they can be dropped.

> If it's deemed clearer, I'd also be OK with an explicit
> KVM_VCPUEVENT_CANCEL_HCALL which cancels *only* hypercalls. But I don't
> really see the point; userspace shouldn't be getting confused when it
> was actually some other kind of completion that was active anyway.
>
> =C2=B9 https://lore.kernel.org/all/20250111012450.1262638-1-seanjc@google=
.com/
>
> Looks something like this in my Hyper-V hcall series (except I already
> shouted at the agent for stupid struct layout and made it go run pahole
> on everything it's working on).

FWIW, restricting cancellation to explicitly marked completions looks
good to me.  If Sean/Paolo prefer that, I'm happy to mark our
completion cancellable and drop our exception fields.

z

--000000000000e7b1140660229ac4
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIBEC
oXB88x7XrixvBaWIzPFN63djxwdOsOY8XvH1hjYVMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTExMzA2MzMyNFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAHEs5BK4HrrdvRAQOYyE5cfRtFeMxDW/mylZOlz5
IdqO37FbwfO9qFxvkBwcNHMdqwk6ivjGh+A+qjbtZtFGAPsxcwJ6kaVqcteZcgOtv60r0u4v5hUD
vgGsn6Qbc0MrfmQBYHGYjL9nRTk4w9c5E0g40iZq02ZBP2VBYmbKiyfTLwSQp3i6xQvYGL0D4zbn
yiau3nAzKOnkwKVSdJ9cysWRIyLDkn8cRrXDz7Ubykx+aXCPR1KybpjOyisnQjVwlfNzO2Rkjo14
MlN3hcqUSc/5AuI8EbLrMZUSQVG/mObgLqHgIZeVnAGrrM4MyumnOORj/3C9Srm6LUhTgpf8rYo=
--000000000000e7b1140660229ac4--
