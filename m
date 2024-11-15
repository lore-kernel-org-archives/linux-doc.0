Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267671E522
	for <linux-doc@vger.kernel.org>; Fri, 15 Nov 2024 00:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731630461; cv=none; b=SP3+27cLIFysZtog5TA158JiQn0G8LyqrFAQEePrOI8DCtbGH66b1yWRT79D1pC/y2Dy5uKtZtLc2/YQpHONFnkX1VOrTRsnWfu2WQ0Ql0IshzsavKa8JHGmzqg5IA2nQkVkmrFYxhIjPhrX8T4aNE9OgiH0JR5PzBBpjgsTvhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731630461; c=relaxed/simple;
	bh=qUh8aBO5HjTTVT4pkbZL3vF6dFi11LiPtT/jggAzkHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbR/J3wRlUbp5mzIqrD2v81VLo5W2QOEDUsdpKhPhiatw078FHLZvXjfWaVhYvF78pwOy5wUFNPyDyiIaF6NfJh27VZ1wnbAv5XKoNOWZ0/H4Fh8iHJ3LuD799CRKkJZ+Fz1oT1RgRIA4PTHPok3wS9pUg5KThVxRnh4EgT/Lqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Fhub9DrA; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Fhub9DrA"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3822429c615so321912f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 16:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1731630458; x=1732235258; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IDNFYbl29WArNRw43E0+thue5BIJbLgAUej5IiRs5Ek=;
        b=Fhub9DrA2unc7U1KaHCgpt6Enj8wjDyOrynXJHER86j7EL0v4aH/JcsrtheRxqZ+Sb
         5m1X1xXbWdQSA0XKtU7vwqsCswBV3jJYlV6liGPjURKPgPALuJ8F5xdsmnf08sZdAFoA
         1Hot3QB0vJ8VcV7NpdcuREoQ2cDRQwZuE8FVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731630458; x=1732235258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDNFYbl29WArNRw43E0+thue5BIJbLgAUej5IiRs5Ek=;
        b=muncXXhhLTPYoi/i33b4iQBLpKGdJsguHsK03nwxfUbUcQmL/DaTICJFd3reenjQga
         oJnMOX81Lws0c1Sk5ZbhbybozXbzSt9m5wqCJj+PUq0hOcdHa6nmHZDtzbALVXHZcuHF
         3YFgNw6xYxQ7BiVw9fpA0y8HaIA0IueFt9+F77joidh6XHZa0YjL6kcs6u/o3wKCck5Z
         S2NX6Rp+RffLuGhso/nY0fJHBrXuhZ0j7ozy2PmgPizsEuJD+2va0COetzlBy4mKssnU
         786lmlWTLwAouOJLrMjtnoWlLd01qP16Ov6s9V+TVFjy5mDEiOkLYgTu3Gn5TMIVxpmr
         Qwhg==
X-Forwarded-Encrypted: i=1; AJvYcCU/v4jZ/B5+koaupNEbs48Jrw4ZX4wgIcvDtvPxKHAHNkAsYLcTA9ucFC0ZU1uAQKKsXDmKXPe1yOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxmmQ5pow0iBQRNUTekfK8MZAVC2v5+1bvUTvizPs/M191Qcmj
	XJWxaUa38P1xyxcLDuJ3wa6CzptDZ7aVwJvjTK5/Tp03aprf8sytJ9LcuF67TqC6XLQXWv/EDuY
	L82v59tpDMTvakSI2CfUL258VDqxie/L6sWcE
X-Google-Smtp-Source: AGHT+IGGuUUlxH8FpXfge9PfFVHHBR5lJDtheC1uEZdPwtcHTmSYbER4V+NCBF4ego+O7B3f8TbIiKJ+wZehu9cNVGQ=
X-Received: by 2002:a5d:5c12:0:b0:37d:53d1:84f2 with SMTP id
 ffacd0b85a97d-38225a21adfmr737502f8f.11.1731630458460; Thu, 14 Nov 2024
 16:27:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113173222.372128-1-ap420073@gmail.com> <20241113173222.372128-6-ap420073@gmail.com>
 <ZzZ_ub26phtVNmnK@JRM7P7Q02P>
In-Reply-To: <ZzZ_ub26phtVNmnK@JRM7P7Q02P>
From: Michael Chan <michael.chan@broadcom.com>
Date: Thu, 14 Nov 2024 16:27:27 -0800
Message-ID: <CACKFLimmY1CBdu9VhG6nUd=o4DjdQwxHVHxbnky7qUWhZK9KDw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 5/7] bnxt_en: add support for
 header-data-split-thresh ethtool command
To: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Cc: Taehee Yoo <ap420073@gmail.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, edumazet@google.com, almasrymina@google.com, 
	donald.hunter@gmail.com, corbet@lwn.net, andrew+netdev@lunn.ch, 
	hawk@kernel.org, ilias.apalodimas@linaro.org, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, dw@davidwei.uk, 
	sdf@fomichev.me, asml.silence@gmail.com, brett.creeley@amd.com, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, kory.maincent@bootlin.com, 
	maxime.chevallier@bootlin.com, danieller@nvidia.com, hengqi@linux.alibaba.com, 
	ecree.xilinx@gmail.com, przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, 
	ahmed.zaki@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	jiri@resnulli.us, bigeasy@linutronix.de, lorenzo@kernel.org, 
	jdamato@fastly.com, aleksander.lobakin@intel.com, kaiyuanz@google.com, 
	willemb@google.com, daniel.zahka@gmail.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000060e9030626e8a282"

--00000000000060e9030626e8a282
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 2:54=E2=80=AFPM Andy Gospodarek
<andrew.gospodarek@broadcom.com> wrote:
>
> On Wed, Nov 13, 2024 at 05:32:19PM +0000, Taehee Yoo wrote:
> > The bnxt_en driver has configured the hds_threshold value automatically
> > when TPA is enabled based on the rx-copybreak default value.
> > Now the header-data-split-thresh ethtool command is added, so it adds a=
n
> > implementation of header-data-split-thresh option.
> >
> > Configuration of the header-data-split-thresh is allowed only when
> > the header-data-split is enabled. The default value of
> > header-data-split-thresh is 256, which is the default value of
> > rx-copybreak, which used to be the hds_thresh value.
> >
> >    # Example:
> >    # ethtool -G enp14s0f0np0 tcp-data-split on header-data-split-thresh=
 256
> >    # ethtool -g enp14s0f0np0
> >    Ring parameters for enp14s0f0np0:
> >    Pre-set maximums:
> >    ...
> >    Header data split thresh:  256
> >    Current hardware settings:
> >    ...
> >    TCP data split:         on
> >    Header data split thresh:  256
> >
> > Tested-by: Stanislav Fomichev <sdf@fomichev.me>
> > Signed-off-by: Taehee Yoo <ap420073@gmail.com>
>
> Tested-by: Andy Gospodarek <gospo@broadcom.com>
>

> > @@ -2362,6 +2362,8 @@ struct bnxt {
> >       u8                      q_ids[BNXT_MAX_QUEUE];
> >       u8                      max_q;
> >       u8                      num_tc;
> > +#define BNXT_HDS_THRESHOLD_MAX       256

As mentioned in my comments for patch #1, our NIC can support HDS
threshold of up to 1023, so we can set this to 1023.  Thanks.

--00000000000060e9030626e8a282
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQbQYJKoZIhvcNAQcCoIIQXjCCEFoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3EMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBUwwggQ0oAMCAQICDF5AaMOe0cZvaJpCQjANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAwODIxMzhaFw0yNTA5MTAwODIxMzhaMIGO
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFTATBgNVBAMTDE1pY2hhZWwgQ2hhbjEoMCYGCSqGSIb3DQEJ
ARYZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBALhEmG7egFWvPKcrDxuNhNcn2oHauIHc8AzGhPyJxU4S6ZUjHM/psoNo5XxlMSRpYE7g7vLx
J4NBefU36XTEWVzbEkAuOSuJTuJkm98JE3+wjeO+aQTbNF3mG2iAe0AZbAWyqFxZulWitE8U2tIC
9mttDjSN/wbltcwuti7P57RuR+WyZstDlPJqUMm1rJTbgDqkF2pnvufc4US2iexnfjGopunLvioc
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
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIO5jCWXCCn92mVTI/Zm7nycf8Zm5yG6D
ym41K2hkAWacMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTEx
NTAwMjczOFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQAoy81JKQrFSEfZqAXTE1d9pLgZs5oVpME3OuegxfILMeyLPpqN
dHv4PbW8j5XhtFrV7+HHKdoThzV3t5VcCyd6vZ8ud1z6ehQL/r92wLEWhNSAyFg+3xgL+HwU5tyj
u3n5VNMWKGINzznqTlsvfV9YnH3P/hO5CpDCBc3vTwlDz3vbabAsSAjXcsKRxdY8UwL0lNXxkG/A
eGaraWcDVBClGcDRN9oskF6pOsY5P5tEWUl8RrsF9itP51oOlxmYi73L3LU1bmTlrY+3/lLv9ipS
y9Ioox9j3DPBOkQroZUtjVWU3MyuSNsHDiLlpsGo5SQhltTmuGPgBQ4BVzHHYzkI
--00000000000060e9030626e8a282--
