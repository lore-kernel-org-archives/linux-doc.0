Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655BF8F6D
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 19:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728416314; cv=none; b=pdP5mUQWxCGrMbEN6e9pRUf5bDBByu3Xy1Ikp6X4/uPUZ7h4btdDnP4gTUNc0LG6fJi6HeJk7CFl4M+SqmVI1KXHSybqUJy8DfSBGnCkUYv05BMG8HAZXNwaOBgiqBP93dC4NXT7YzbGSvUqNotOR8wMpY3NVOSXLGWo/DtEsGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728416314; c=relaxed/simple;
	bh=OpCrBLuQbdoS4/Cs0LTASt9Jvo9OiKDJcigSfOFmAbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f53Lqhd8XKy353MhsqHkXXh5+QaHtSGNrWF+hv9W8AtBZwYf1ISXtt/mSbOFLvHVfV7do0b5zffWyc1jvKUmLAxLqrnN7Arkv8gpfrwdooBxQCZxlDeyumUWnd+85tLECyMxfT3Ds4UXe4S2sqtV1yzBHqufdMHH10/iAWg7xVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TSLiU9ZY; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TSLiU9ZY"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c8784e3bc8so8293101a12.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728416311; x=1729021111; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f95S1+8UTSmebiKLt5c8TtZc8jBbGgVdogLhfXvg3BU=;
        b=TSLiU9ZY5tX37NTpWNLVpiWtjFNoLrqhfiTpELDZ59Yg9jvKr1Y6zBah7tItzFEO6m
         dWMJ4StZ4PWyZcvoBlLRuUvhyURcstB9zgP0ExC5djRn7I3szYTy1JV/35mTA+lTMdu2
         7ghhPan9GEo3ySpte0oJtigyJyQRmfjTCOobw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728416311; x=1729021111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f95S1+8UTSmebiKLt5c8TtZc8jBbGgVdogLhfXvg3BU=;
        b=oTb2d58CKzhIICBuvQeDOcdfLxaIhp9vXWR3zaJcVEszyGEDMEkuGRD/BuukTpNnEf
         mSk1KWM3cwchauve1QUjK7DHRpqz0ZTZ2nDZwd3HqH+zMcx+OzXxrRHZLjrdCePf9hX8
         cTghsORtzFKFsCUPV0eAFNNvtW7piQcEfJj/P4qb14LIdDtk0Hwy+iiHToZMwWI5oGDP
         RIFKCsEnpZKiGflz5i7RzU8UHRP+L2yNNIG5alh8RE1jXDJBrsyRPDDpB2pTg0K/F6VO
         P9BpIREObHpnU/GkfWODZnjqAuvwhbITKSZIG43UTrGo+BkWHZgJXL7/9ZHr2++8a5gh
         0Zig==
X-Forwarded-Encrypted: i=1; AJvYcCWzXu4HIxLojw09+rgH+b3qg0Pjni48wzwake54N6ewz/swfLMMainB+q2IpizVbv/9N11X4bm2SgY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9rQyxDXRerEKIc72ydALMazhJt43ll+UdiF0tQ+BmoQDV5Ld0
	vHJIKm1DAKyVRQm3hb5ubbkvqnntXlSZUQ98td4+cTeOyQ5IOiSFAPKU52FcvLRpES4ck1P24lf
	rWWMIUVUd+lhP8DcVq1o+EOw2MRrkvCzP9cwu
X-Google-Smtp-Source: AGHT+IFeRDd2GgkS2/iUexKsQ+n5zHZM9aTO9huxTkGNvkSaUz86pTtszz14Nyxo/GXgi/Cc0WzQx7Cv1E2mADRR8I0=
X-Received: by 2002:a05:6402:3549:b0:5c8:8381:c2c8 with SMTP id
 4fb4d7f45d1cf-5c91d53f490mr66094a12.2.1728416310597; Tue, 08 Oct 2024
 12:38:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003160620.1521626-1-ap420073@gmail.com> <20241003160620.1521626-2-ap420073@gmail.com>
 <CACKFLi=1h=GBq5bN7L1pq9w8cSiHA16CZz0p8HJoGdO+_5OqFw@mail.gmail.com>
 <CAMArcTXUjb5XuzvKx03_xGrEcA4OEP6aXW2P0eCpjk9_WaUS8Q@mail.gmail.com>
 <CACKFLikCqgxTuV1wV4m-kdDvXhiFE7P=G_4Va_FmPsui9v2t4g@mail.gmail.com>
 <a3bd0038-60e0-4ffc-a925-9ac7bd5c30ae@lunn.ch> <CAMArcTUgDLawxxvFKsfavJiBs0yrEBD3rZOUcicYOAWYr+XYyQ@mail.gmail.com>
 <20241008111058.6477e60c@kernel.org>
In-Reply-To: <20241008111058.6477e60c@kernel.org>
From: Michael Chan <michael.chan@broadcom.com>
Date: Tue, 8 Oct 2024 12:38:18 -0700
Message-ID: <CACKFLikDqgewWCutDG9ar6UFup_EUefUEaXShEg0kmxC5yiHMg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/7] bnxt_en: add support for rx-copybreak
 ethtool command
To: Jakub Kicinski <kuba@kernel.org>
Cc: Taehee Yoo <ap420073@gmail.com>, Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net, 
	pabeni@redhat.com, edumazet@google.com, almasrymina@google.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, donald.hunter@gmail.com, 
	corbet@lwn.net, kory.maincent@bootlin.com, maxime.chevallier@bootlin.com, 
	danieller@nvidia.com, hengqi@linux.alibaba.com, ecree.xilinx@gmail.com, 
	przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, ahmed.zaki@intel.com, 
	paul.greenwalt@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	asml.silence@gmail.com, kaiyuanz@google.com, willemb@google.com, 
	aleksander.lobakin@intel.com, dw@davidwei.uk, sridhar.samudrala@intel.com, 
	bcreeley@amd.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003f56d90623fc483e"

--0000000000003f56d90623fc483e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 11:11=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sat, 5 Oct 2024 15:29:54 +0900 Taehee Yoo wrote:
> > > > I think a single value of 0 that means disable RX copybreak is more
> > > > clear and intuitive.  Also, I think we can allow 64 to be a valid
> > > > value.
> > > >
> > > > So, 0 means to disable.  1 to 63 are -EINVAL and 64 to 1024 are val=
id.  Thanks.
> > >
> > > Please spend a little time and see what other drivers do. Ideally we
> > > want one consistent behaviour for all drivers that allow copybreak to
> > > be disabled.
> >
> > There is no specific disable value in other drivers.
> > But some other drivers have min/max rx-copybreak value.
> > If rx-copybreak is low enough, it will not be worked.
> > So, min value has been working as a disable value actually.
> >
> > I think Andrew's point makes sense.
> > So I would like to change min value from 65 to 64, not add a disable va=
lue.
>
> Where does the min value of 64 come from? Ethernet min frame length?
>

The length is actually the ethernet length minus the 4-byte CRC.  So
60 is the minimum length that the driver will see.  Anything smaller
coming from the wire will be a runt frame discarded by the chip.

> IIUC the copybreak threshold is purely a SW feature, after this series.
> If someone sets the copybreak value to, say 13 it will simply never
> engage but it's not really an invalid setting, IMHO. Similarly setting
> it to 0 makes intuitive sense (that's how e1000e works, AFAICT).

Right, setting it to 0 or 13 will have the same effect of disabling
it.  0 makes more intuitive sense.

--0000000000003f56d90623fc483e
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
OnaLEot1MoQO7BIe5S9H4AcCEXXcrJJiAtMCl47ARpyHmvQFQFFTrHgUYEd9V+9bOzY7MBIGSV1N
/JfsT1sZw6HT0lJkSQefhPGpBniAob62DJP3qr11tu8CAwEAAaOCAdowggHWMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU31rAyTdZweIF0tJTFYwfOv2w
L4QwDQYJKoZIhvcNAQELBQADggEBACcuyaGmk0NSZ7Kio7O7WSZ0j0f9xXcBnLbJvQXFYM7JI5uS
kw5ozATEN5gfmNIe0AHzqwoYjAf3x8Dv2w7HgyrxWdpjTKQFv5jojxa3A5LVuM8mhPGZfR/L5jSk
5xc3llsKqrWI4ov4JyW79p0E99gfPA6Waixoavxvv1CZBQ4Stu7N660kTu9sJrACf20E+hdKLoiU
hd5wiQXo9B2ncm5P3jFLYLBmPltIn/uzdiYpFj+E9kS9XYDd+boBZhN1Vh0296zLQZobLfKFzClo
E6IFyTTANonrXvCRgodKS+QJEH8Syu2jSKe023aVemkuZjzvPK7o9iU7BKkPG2pzLPgxggJtMIIC
aQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQD
EyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxeQGjDntHGb2iaQkIw
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIAOEW9t7uskpT09J+KK8GntbtNhbdv2j
HiXneY3N1OQhMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTAw
ODE5MzgzMVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQBebsJD4YzJiU+Wl58/ptUU7Pu48hE6AGUEWqMFLggCYx1sZ5kn
7FdfeRLTFykiWydUUgRl4BCYkfjiNvE+MOAYBa6rKLOeJwGkCrASxws3G912HnNhKTuTgxXGNPE8
DJ6meNBD4XE7ux9R63CcOAoeccbqh1Z/pFRuytxcQRyFmnsn6PnRH6X8xGswmT+wKewXKPLl9jtK
5umf9V+PWZrGKzNAAq61V/7M6uM79CqGY4xU5fxXaDhraRsvYX5uluzMSP2y5khXHZVAa4Ek6aLx
FH/g8QkTgPTGWYU5OHDspTdQeNXl8wkqn1Zcv+yFvvZXM3vTHkkTDdNstTGPOF4m
--0000000000003f56d90623fc483e--
