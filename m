Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96794DDCD
	for <linux-doc@vger.kernel.org>; Thu,  3 Oct 2024 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727977415; cv=none; b=BgOifV2PxqgIjYsYSlETjNT6BDj9rRd0ci+G1OU5AjAT87NhZN1wf72HHykN86FWaPV6NzeuXcbc5YyX+Y92v/BttGb84MotOp60x6tjS0TsHd3jlf35FcydBWskgsfNwAtOiXt55g3woDhfPjsLBjxhoDM9lkDx2Sm2XzYupfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727977415; c=relaxed/simple;
	bh=bTM+Rb7lmKFGD+vCIUaGaph2VRKY+8/rQNMBsJlfPIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqF6DBHMHG1T9oBOhTJgCSMzlx/4e3ZJ9UI4KEQv2R0nDg4MUbvAKPLaFKYlclpSV9Rpe/UpKcOpbxu3kLKAzkZax4ALQepW1Dw65XdtwEAEhJT5j0neab/CYH5DdsptQLMGJFWN9h3HzTmuUjUpnpfCUEPwxuxHssWVsZISZOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Fr5Vu1Qv; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Fr5Vu1Qv"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2facf48157dso15249561fa.2
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2024 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1727977412; x=1728582212; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qKgdooDBWln4DV2v8isgC6tzeS6F3lJ2ugZVmCU8pPE=;
        b=Fr5Vu1QvGf9dR6GdBI9eGKcZIr54ZEsRhFZMmi/vrnflXCWn3vrNWLxx0jYZEuf/qO
         tsQsupFAKWugMTsz6Wa860s3pXvLeKeFOB6kPGi8ByjanWXGfBtFVTjgx/J1ljRPQ+J6
         rDXD3AYXtvXNA3ShPk2RJsw4q9OQ3RXS1sBGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727977412; x=1728582212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKgdooDBWln4DV2v8isgC6tzeS6F3lJ2ugZVmCU8pPE=;
        b=cD4PrpUirVOh766gmcvTWtCsEmUK2CRDwmggbuFHiRDNwLe6T+xKcENFHStlNStJv7
         s9Q4NHGqFhiuDPrVJCb98KV72vDKwJR0MLy+02dvbQpqc5VlYWajLe8Ufnv+KpiN0mPd
         bbTrp8YUTbpOBNkp6OiUWU9wkQuEDISleOe9mQMByvThFA+49KHnMEIafQHt/p6lqTyC
         lqpt4gahG/syZMDXiD7AdB+KWVmGzOnDBhqXDbXNBxYRjNcMiKhjLfUNkJITP+9/jaWP
         QCkvISEG1zlHa9Yc3klTTOjEnQ2vOpq6ScrYdAXk3UuHNZfRMaJYdx3q87m+Z8HW2L/v
         RM3g==
X-Forwarded-Encrypted: i=1; AJvYcCUl0cn3eiUpX/um/Dxe0QTeq2imS63PQrSPPsTfsFh+FOtRcslKT+gRA+b3+hal0vupOEeJTvOkyoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ulaP2Az1Qft7KF1VS0a2luWs/7vlgRs/8MJzHtwpNIINqtIG
	kiCORVJ2KaCQRU7B77sOti6MLBX0wW9WegJRVsyNEvxJBqLl4rdt7SI5iqtkZy9XP7a7Xy+vY3r
	7/a9c5Unsj7+VDBuIds8B1PmoNDuWQHH9/g8I
X-Google-Smtp-Source: AGHT+IG+KAhWxoCH+G1PsjZi/yxxVDtmfgQUFVZwIepUTrDNb/Bsp1HKGY64ucGPhNv3OZzluD5dxvk4iYmMWKy0Ul0=
X-Received: by 2002:a2e:9585:0:b0:2f6:1da6:1c64 with SMTP id
 38308e7fff4ca-2fae10aa1bfmr39089151fa.45.1727977411629; Thu, 03 Oct 2024
 10:43:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003160620.1521626-1-ap420073@gmail.com> <20241003160620.1521626-2-ap420073@gmail.com>
 <CACKFLi=1h=GBq5bN7L1pq9w8cSiHA16CZz0p8HJoGdO+_5OqFw@mail.gmail.com> <CAMArcTXUjb5XuzvKx03_xGrEcA4OEP6aXW2P0eCpjk9_WaUS8Q@mail.gmail.com>
In-Reply-To: <CAMArcTXUjb5XuzvKx03_xGrEcA4OEP6aXW2P0eCpjk9_WaUS8Q@mail.gmail.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Thu, 3 Oct 2024 10:43:19 -0700
Message-ID: <CACKFLikCqgxTuV1wV4m-kdDvXhiFE7P=G_4Va_FmPsui9v2t4g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/7] bnxt_en: add support for rx-copybreak
 ethtool command
To: Taehee Yoo <ap420073@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	edumazet@google.com, almasrymina@google.com, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, donald.hunter@gmail.com, corbet@lwn.net, 
	kory.maincent@bootlin.com, andrew@lunn.ch, maxime.chevallier@bootlin.com, 
	danieller@nvidia.com, hengqi@linux.alibaba.com, ecree.xilinx@gmail.com, 
	przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, ahmed.zaki@intel.com, 
	paul.greenwalt@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	asml.silence@gmail.com, kaiyuanz@google.com, willemb@google.com, 
	aleksander.lobakin@intel.com, dw@davidwei.uk, sridhar.samudrala@intel.com, 
	bcreeley@amd.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d3ee130623961773"

--000000000000d3ee130623961773
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 10:23=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wro=
te:
>
> On Fri, Oct 4, 2024 at 2:14=E2=80=AFAM Michael Chan <michael.chan@broadco=
m.com> wrote:
> >
>
> Hi Michael,
> Thanks a lot for the review!
>
> > On Thu, Oct 3, 2024 at 9:06=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> =
wrote:
> > >
> > > The bnxt_en driver supports rx-copybreak, but it couldn't be set by
> > > userspace. Only the default value(256) has worked.
> > > This patch makes the bnxt_en driver support following command.
> > > `ethtool --set-tunable <devname> rx-copybreak <value> ` and
> > > `ethtool --get-tunable <devname> rx-copybreak`.
> > >
> > > Signed-off-by: Taehee Yoo <ap420073@gmail.com>
> > > ---
> > >
> > > v3:
> > > - Update copybreak value before closing nic.
> > >
> > > v2:
> > > - Define max/vim rx_copybreak value.
> > >
> > > drivers/net/ethernet/broadcom/bnxt/bnxt.c | 24 +++++----
> > > drivers/net/ethernet/broadcom/bnxt/bnxt.h | 6 ++-
> > > .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c | 49 ++++++++++++++++++=
-
> > > 3 files changed, 68 insertions(+), 11 deletions(-)
> > >
> >
> > > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/=
ethernet/broadcom/bnxt/bnxt.h
> > > index 69231e85140b..cff031993223 100644
> > > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> > > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> > > @@ -34,6 +34,10 @@
> > > #include <linux/firmware/broadcom/tee_bnxt_fw.h>
> > > #endif
> > >
> > > +#define BNXT_DEFAULT_RX_COPYBREAK 256
> > > +#define BNXT_MIN_RX_COPYBREAK 65
> > > +#define BNXT_MAX_RX_COPYBREAK 1024
> > > +
> >
> > Sorry for the late review. Perhaps we should also support a value of
> > zero which means to disable RX copybreak.
>
> I agree that we need to support disabling rx-copybreak.
> What about 0 ~ 64 means to disable rx-copybreak?
> Or should only 0 be allowed to disable rx-copybreak?
>

I think a single value of 0 that means disable RX copybreak is more
clear and intuitive.  Also, I think we can allow 64 to be a valid
value.

So, 0 means to disable.  1 to 63 are -EINVAL and 64 to 1024 are valid.  Tha=
nks.

--000000000000d3ee130623961773
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
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIB9jPrXs3O86TcfFT9HKJj8c5Xd3SQFS
JfRDQtzuGIF3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTAw
MzE3NDMzMlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQANMgt4GIMy6wC+mGnsrIeCT6GYjvLGLoZ9vAsMbraX4kmyAYlB
GzaS2pLYlI199onzsHnNetQGXH2bf5Y96HI59N1OJHDgdAfROdzoPb2zuNNcaVbLhTvbH+yyIbDd
c1lkg9QWTVoba1/BoupyRimUOHep5/wDIaKCuRN0zbKnFpZbA7ZSnv/HXHDb6wcIwYn1ibNBXGJf
MuD7qTaOogySjmglNO51nM0YBUCd76DVjj0iqeth+0ssmz5xPHg1hUtfboXo54T+ulmuGMZGutEU
iPrMDXUdWTS8VQ83i88wfBWpD9d9fapfEwgQUqBXy8zayT3X4lWJtBa6kNJd+h5Z
--000000000000d3ee130623961773--
