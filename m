Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BF122F848
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 06:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736922442; cv=none; b=cC0V7wFLJ4kpSKQwhMmGZ+AOqn7SQOdV8cqL4VU5OIQAVUjHC/dgRBrznYFKFKMvlUFSfXfHDkAuku0QJb97gQSbWljVVG/d2UjQBYUOSdC08G5RbDm+2+t1kWvG/LTaywk4sDKFPq/JnYa5jZE9U0Gle3tdtWWPoHk9hLp5fPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736922442; c=relaxed/simple;
	bh=S9D7YlOWpbgkb2QbI2LW2MEtUEaOhWn3aZYc94ud5As=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHC1ayUYWXupCy/4PGWULVSGzJjrW2+DsqsUGgk/WOE3geXwiDQkmatgsgNVnVeP5xNyUy8or7bqDnGBWFSFwe6UO9GKIoxvm748XCW4Jt8TAE/K2Eht/S6UdbzQekeX2dLsm5xkbygLhLxo9JFg0/bNHunjftdCpX4ICsGtx3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=as0p0efo; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="as0p0efo"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so8504698a12.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 22:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736922439; x=1737527239; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S9D7YlOWpbgkb2QbI2LW2MEtUEaOhWn3aZYc94ud5As=;
        b=as0p0efomqfaBXjQPftkqWWKOYinnumJ6OR36ELyxhbJZzPkjD+SjirdOjQ8PiKr0n
         sH/Miwnw7UzNK0E4ThGQdrNJxFM9aLXkyQXXzcS7HTY/Q68oPL0kq8Edq/5fUqi4TAKT
         WP+bpjF3EJH3M+LVSeJn7eJ1GIuUpeALqzoK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736922439; x=1737527239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9D7YlOWpbgkb2QbI2LW2MEtUEaOhWn3aZYc94ud5As=;
        b=RiOP9EEDcI23f1LRNi+3MQMt27DfkSPqlxlBbgggpm1iqvPoCv59Ko4NHUjo5l6B3N
         fX5EvuhuSXbU3Hl59MWcut/698045qEyIAoSZWAAyGGxdann3N5Yj7+x8bodmOVTGxbL
         LKdEhtaghfL1Uu4kJAiMDV+7oM/0p6KE4q7RqR251Nht/dhBdOoWSziGkuTtxF9PvpvI
         EfS5imbHPYmm7SZv68cX+ehuFpJpwJtE1T6fqbdvpbXx7aN0tReIurWJn2g1dJ+HR6ep
         uwiQZvMJdzjn/hNMrcePgMmufV6w0KyL6q4dhJmzV/gmJav3GM1fe2lM603Su0HeLXPy
         QVZw==
X-Forwarded-Encrypted: i=1; AJvYcCUb8lRc9r49H+f9mGyKO6RGLdXy4cTMZMl1hmiI7w/WpVmf6pwr4oglJZVWhSfwEYlKeQ8/aDR8Dnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYY/jEZ0oZnlplFmZXLi5DulEPSYCpGD/wmyP+R3YWi/q7AThX
	1RcXwNqvNaJDDMGDJtx1l+U2KxgAKnOLmk/BJWXCQrBjKYKSP1b+rPZgUuSBIhG/uU/1bLp5no8
	BNb2bmMjpTL6ruANkSCJW/Apxte6PQDmgtO4I
X-Gm-Gg: ASbGncvqUuEfrAaHxtNRUpi/vqwLOgXZQE09oqqcr0wZuZCPUxJk1NCs6OiXJ8SXYRW
	FtBO5dgQ3d4k4HW6qKSTzdH0FS+79ZDmhrIo2gg==
X-Google-Smtp-Source: AGHT+IF8CEsTwk11B+6UhVAGtdWopl3EpXHP8c94fh5QzFBZSatgIvqI1GZsyzu8J3vyzk+6A+5XT0uFttvQLVwe6Ys=
X-Received: by 2002:a05:6402:210f:b0:5d4:4143:c06c with SMTP id
 4fb4d7f45d1cf-5d972e4c99amr21964424a12.23.1736922438844; Tue, 14 Jan 2025
 22:27:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114142852.3364986-1-ap420073@gmail.com> <20250114142852.3364986-8-ap420073@gmail.com>
In-Reply-To: <20250114142852.3364986-8-ap420073@gmail.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Tue, 14 Jan 2025 22:27:07 -0800
X-Gm-Features: AbW1kvb2p3dIgY7kH-dlrbjBahX4kg-cwKTUY8AeKKb1mw77zf0nvT7M9U_p6HQ
Message-ID: <CACKFLik_eG_DQNWdWUX1W+Z1NybzQ6+Sxu5YvHtvdcotfY_pRg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 07/10] bnxt_en: add support for tcp-data-split
 ethtool command
To: Taehee Yoo <ap420073@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	edumazet@google.com, netdev@vger.kernel.org, almasrymina@google.com, 
	donald.hunter@gmail.com, corbet@lwn.net, andrew+netdev@lunn.ch, 
	hawk@kernel.org, ilias.apalodimas@linaro.org, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, dw@davidwei.uk, 
	sdf@fomichev.me, asml.silence@gmail.com, brett.creeley@amd.com, 
	linux-doc@vger.kernel.org, kory.maincent@bootlin.com, 
	maxime.chevallier@bootlin.com, danieller@nvidia.com, hengqi@linux.alibaba.com, 
	ecree.xilinx@gmail.com, przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, 
	ahmed.zaki@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	jiri@resnulli.us, bigeasy@linutronix.de, lorenzo@kernel.org, 
	jdamato@fastly.com, aleksander.lobakin@intel.com, kaiyuanz@google.com, 
	willemb@google.com, daniel.zahka@gmail.com, 
	Andy Gospodarek <gospo@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000fda7ae062bb8c447"

--000000000000fda7ae062bb8c447
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 6:30=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wro=
te:
>
> NICs that uses bnxt_en driver supports tcp-data-split feature by the
> name of HDS(header-data-split).
> But there is no implementation for the HDS to enable by ethtool.
> Only getting the current HDS status is implemented and The HDS is just
> automatically enabled only when either LRO, HW-GRO, or JUMBO is enabled.
> The hds_threshold follows rx-copybreak value. and it was unchangeable.
>
> This implements `ethtool -G <interface name> tcp-data-split <value>`
> command option.
> The value can be <on> and <auto>.
> The value is <auto> and one of LRO/GRO/JUMBO is enabled, HDS is
> automatically enabled and all LRO/GRO/JUMBO are disabled, HDS is
> automatically disabled.
>
> HDS feature relies on the aggregation ring.
> So, if HDS is enabled, the bnxt_en driver initializes the aggregation rin=
g.
> This is the reason why BNXT_FLAG_AGG_RINGS contains HDS condition.
>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> Tested-by: Stanislav Fomichev <sdf@fomichev.me>
> Tested-by: Andy Gospodarek <gospo@broadcom.com>
> Signed-off-by: Taehee Yoo <ap420073@gmail.com>

Thanks.
Reviewed-by: Michael Chan <michael.chan@broadcom.com>

--000000000000fda7ae062bb8c447
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
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIP+mf8d1ZcNfTPSn53x16/blKSWNcPKB
YGAsvDqvyFgoMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDEx
NTA2MjcxOVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQBNIWkai/cOBBYjjUoL9mEGQoup4rPc6TkiDJc0Z631MlDFTRkM
9BRzFAs2hWRF45bMGVvz7doVh+1qtHGidRe0autO+ZMudy6w4SezYrMrmX92Dx/+BayCWWdHFc+/
sJdHEHOVk3Js+4pa0tiO66QW2o/vsS5aP+B+xOvFM0ugJfP5GTRp2N21QQv25Y8jpwZ9Gdlfsef4
JQ/ZEcuGWfFCnn0rOPhrwLFJvKkPCUat2wvt8ZpGndVOje2PMR/TrpkMkdLymoZs68JZQYy+28Fv
OiFhPH2jprUswpDDPhPC0xFwhJME0enTC6JSLu04C/D/s5tOfWyMk4hqekjleWkN
--000000000000fda7ae062bb8c447--
