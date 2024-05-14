Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C49D181D1F
	for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 22:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715727310; cv=none; b=OhstTTr6ZL//klAI8LyeMtZWtRT3HPQb+Q9aS19ZO6qf/w4RxTC2Hl0EHf+ID47McHjhZrq0gSFwN5RmrXFudBVjvVGw6Jd6KzKPvoa7NkFk2hyYVIIL0H6wv17KLAce5yT3S3GmdAJZ0/MVlVvcACHUDMoit1rSoOwG4psOpms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715727310; c=relaxed/simple;
	bh=sZoO1KDUgQ67e/N2j/GMEnJRddbC2Q5cq4pJrALBx3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RK8+eFZOmPCGppXSCOcVXce0qYD+Mico9v/6pUDPkLXjTctWIghljAlTzZVS/LmAlwsRRUfNl9/jaR4cC047+6V5ILEnUu4PfKgRFRW2B4bSCZWr9I/VeIHjByFYy1CkcQ7H+ulZ5JbYbqwpAReCY5l56dihhZ0ELAyLJm6Tvx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xWQBl3AB; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xWQBl3AB"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-43dfa9a98d2so623861cf.1
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 15:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715727307; x=1716332107; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sZoO1KDUgQ67e/N2j/GMEnJRddbC2Q5cq4pJrALBx3o=;
        b=xWQBl3AB3Hy2JKaD3hBz1wWLGj4sQTkuuQ9N+PBQwtoXVayiqIN350LD4vyAEluiIx
         Dk0Qe7UgdoFnXxIxklszn2ekmesckevp+MzrxqhPHuFnVRU8gQGl1wc3ujrNyz009tYa
         CTQmWbvkiE/CLXRmTotJACiUkQKh56fru6p7WaborM9wL1SPEaoGapJQ65HewmRwDSrL
         IAvpMC1CVC1OZ4x+bKxcqkFjeJLPxpmHsgisx4jjKURuP1XCyRV8AvG+tNVLDJVSRXxo
         C5TjNe966Rx4KthJFnpnt+6ip1a+kBotzEmOfbIF3WX3KMBtCQitPyV568CiJTwSo8tp
         quCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715727307; x=1716332107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZoO1KDUgQ67e/N2j/GMEnJRddbC2Q5cq4pJrALBx3o=;
        b=V5fmAjoRnHpJPJpQboGBmvlhkdBlV3VAVZWCkcGhnDuC7VFHQciI4aGSt1bikZR42P
         gbEpysmNHauehvtMxFAQyBqd7HGOcWOm4ElZEz2xp9O4TDvU8+4QGtU9lU3F9+4xx4z9
         /oz/gSjYTVapiUG/JlpW0U+njbKErNg+aoxa0TcC6dxK4fOcSZ+X+RSpQ5tKl3UdV08H
         amEpDd3XhFd6vXcbYLPCZpKglbviGrUsslPyrIYTwkcAac3E75gIcPLdVrjVoJmrmDtX
         4PleSKObrnfoAMO+2k9u3lYXwMJmhITVjDkGmNMnUyAzRRhT4+EPzgcZqOCtQQs8BOs/
         g90g==
X-Forwarded-Encrypted: i=1; AJvYcCVYl/mDPAth6SOIRO7YpX8Y8YOvexLfJ8bNnjFWiveq0YsiUCQst7DV54ZmgZWg+it3zLUGUC+ua7CtDscSSqU7zZiBeVbCEgAq
X-Gm-Message-State: AOJu0YxhKjRJ9Mvt1wUX0G363PxmyYFdQNftJtGeto1tnV5GyGbLXDpl
	Rkd1oCtrD/o/VHlTBrna8VVWW/B+E3DV5cXMH8UxpWvZVWFGV9yrMXn3iTUJI49zOwjMRp7afRR
	f/nZCthuy3rZnof0v0nwBK352zWUKctHNUOBKwKVoU9w9LLKTHg==
X-Google-Smtp-Source: AGHT+IF9P5W3cBbbXJ/YCOroFyO3+ejJE66bKoruWawt3FGHVxgLwV0rDoB4g5TANAF15SBnY42U+Qdr62P3v5MGrQc=
X-Received: by 2002:a05:622a:4a89:b0:43a:aa3f:917a with SMTP id
 d75a77b69052e-43e0a2e2fcbmr9890581cf.27.1715727307500; Tue, 14 May 2024
 15:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328142004.2144568-1-jackmanb@google.com>
In-Reply-To: <20240328142004.2144568-1-jackmanb@google.com>
From: David Gow <davidgow@google.com>
Date: Wed, 15 May 2024 06:54:54 +0800
Message-ID: <CABVgOSnP=aYBeqX0-rK00m+cQAhdT6S8f+Uo3kvZ=hFTM8LFvw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Clarify test filter format
To: Brendan Jackman <jackmanb@google.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Higgins <brendan.higgins@linux.dev>, rmoar@google.com, corbet@lwn.net
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b7f876061871e43b"

--000000000000b7f876061871e43b
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 22:20, Brendan Jackman <jackmanb@google.com> wrote:
>
> It seems obvious once you know, but at first I didn't realise that the
> suite name is part of this format. Document it and add example.
>
> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> ---

We can take this via KUnit -- sorry for the delay.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

--000000000000b7f876061871e43b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPqgYJKoZIhvcNAQcCoIIPmzCCD5cCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg0EMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
JEfDtvHU6wy3MSBE3/TrMFcGA1UdIARQME4wCQYHZ4EMAQUBATBBBgkrBgEEAaAyASgwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/
BAIwADCBmgYIKwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNp
Z24uY29tL2NhL2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgw
FoAUfMwKaNei6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEB
AGwXYwvLVjByVooZ+uKzQVW2nnClCIizd0jfARuMRTPNAWI2uOBSKoR0T6XWsGsVvX1vBF0FA+a9
DQOd8GYqzEaKOiHDIjq/o455YXkiKhPpxDSIM+7st/OZnlkRbgAyq4rAhAjbZlceKp+1vj0wIvCa
4evQZvJNnJvTb4Vcnqf4Xg2Pl57hSUAgejWvIGAxfiAKG8Zk09I9DNd84hucIS2UIgoRGGWw3eIg
GQs0EfiilyTgsH8iMOPqUJ1h4oX9z1FpaiJzfxcvcGG46SCieSFP0USs9aMl7GeERue37kBf14Pd
kOYIfx09Pcv/N6lHV6kXlzG0xeUuV3RxtLtszQgxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIz
IFNNSU1FIENBIDIwMjACEAFsPHWl8lqMEwx3lAnpufYwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEIJEwtRrQpSWXfRVHwdydi49xGcS1u7WvF41OIc9795uBMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDUxNDIyNTUwN1owaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAQ4+/y
0ieKrxMsogzuaILBCROpAbEZd1nWBfuGgFpgY8GzFoPYQ/eGgSVUlfysU/cmZkhTxXhTuxPDL4XV
6Fvnb4PqscZWaMbLkHy/JBWzdxQpCCKcTso5BaIEabcL3aUyIUtP4bYtyLcx9TKlWWr0aFXmMsTH
8TPTwiDx4AKkciBDFXTLShCm/dnLNNJpC4cY4xvy3txbTcRlfeajA2fBO0HUf2iGRiOF7/6Z0YWQ
zBKCh26bCfz6kTehcpVamz3L64xDN4SU2jvLFnAS+WJbkgNvSeBgKES4rk08IOm5B3qS83lC/6bq
mpeby5HJa2nbVbgG9cFUXmlP5jjYUwP9
--000000000000b7f876061871e43b--
