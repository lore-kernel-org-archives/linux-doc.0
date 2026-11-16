Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833575;
	b=zL1Mju2d0q4FzqKrDU3uU5VJ9vQ9WiakSBlSYborpI9fyE+B+qr+EF4SygcRi8JBwNn0
	 wvZAQ+IGg7Vgz5ysQb71jpHrsmBq7YvHNUUYTA367bKPe/OC3Aa8JdLkvgutqLT7ny0Pg
	 6Gi7Wz2x/aUIEaGgLln7LQXJpEShL8xm55/iNePTt5C5M17lTixl7FEjCX6ycjEhSJQs1
	 wZkbeg1OHNqpTONdpmMNlDLC1RvIiPbgzTrP6TaRyiCuVhxjuAFDVpaa/XT9CLZsC+jSV
	 8/PFsMa3NVpCGHXkpkPy+yu8/S81aSxHixtFFiuzD7jHd6zgXpox13IFrfsejZycs0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833575;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=saDXMzIo8kiOjeM1EMS87QEGU65zD4sXBIp4fj/XDzA=;
	b=qCI0VgasKwf54ZLgYLatMg/ogYR3VaecUI2zcj+0jtfTWXBPdTbBoxd090xE5MMmeOMv
	 x2lyUX+7r3GzGzd8xNS/g5cUWfpLnP/EmaJD9IJtg4hT4gY8Zi1FSkGzyTmcWQlXQT4Ae
	 KuQf4WmdTXO2jUetXvNQr8LXWM1C/zFJESUZkdS3ZJN6B2geJhM/5/HhpV9+/MfakvVNv
	 ECBGp1CibBc9ChWmQblVHIkaIUQnarH0D0X9sXuaiNjDVMCoegRCA5Y4TCp3dJBM21Ny6
	 GElYS45wfIBvrhXfprRAmRpsKqcYJJUp+bw1H5DVlEjUdRm3RvwGUGWcbBJdNf9GtHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=d+RZL6ny;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81497606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 12:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81497606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=d+RZL6ny
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1747997a91.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 04:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833574; x=1795438374;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=saDXMzIo8kiOjeM1EMS87QEGU65zD4sXBIp4fj/XDzA=;
        b=g6988G1MULWifNUrX7PsciOFUy3TicIGvuTCAD4ZxzgYSJ2b46Aa5jflL15H40D3yN
         IVD08FPGj7+lCN0ZetWpZZsfHXKfbZgD+m3aPdixS3NcCvzHZCfypKor4CqGDPDLzIGu
         n8/2SX7BVy/9jpTFIS3z55PMPUGlsZR8QyVO+s573ZsbPihce2XZp/kgx6lFXwtBLB3h
         NNk/nSAqw3oArEbzmTwWb9nMUx3WypQalk8UAUJCQZrc1ocvTgolENB8XBX0Fg8W7V2H
         2BkQLGsq4xCKSimoIUwJMyb6SBA8Zu+b555GFdT4v00Abr25sPGoL1ZZHwT3ibQLyS+1
         LgVg==
X-Forwarded-Encrypted: i=1; AL+hErGApRYIb5uZ1SjEvdn5+OS4varJa+TJ/ipWcaR1Qd3sVy82lAZwl15BruDzdJdQm2qXRNWk6hXz5BA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hX7lk4p6Av5msXAqvw0kCk51jRxTEp6+S+iNVphN/vhmXBjQQ
	AYpPpeStmbEz2SkWM20gdwXiUNuMvpKswtCFLVvrqhFajTNjc9boxxmgIautA/AUwV6No3NOThO
	hMrZpkm2iaBA4uw2QqD27hqskCMeqrYhMg+mev1nICS6TUxfc6r2l73k9a9CI/st7Ik4pVKNv2s
	yYqUGtw7ILpoBjoX6pM7rL73THDxIgKCheB4wCoiU/37Lcz32o//OAfUabQaXAH3GIYyA3esHBq
	7AWkw8DD8Yox9eE9kFv
X-Gm-Gg: AZFdTZfUPm0GdEHj59OOJqm45Uh2lmqWXPIdNOVMMHD8xAI0Vx6s+MIPiwWRFtewQeU
	pn4lVYDWmKgv5Sy6m/uSf6FZt4RlNMZ/HkScHqcMUpKak8E/98wr+keL+5k3dzNv241efKxP86t
	Z8D69lr+ve1y72la7sdirGLDV+E69F+DaZtZ9U5NskUTjn0RZBgNxHL0IOdbrGYkzYr7mKL2U0/
	0CT/vKL3Ydybw58s31KOCbtJYUemJNiDdTtgASMBtOL439ODEt1x6rQsGtoaa+/l0rwEKOrPOPn
	IOTHHhRrdmAqWCZKdJDSAMrz+DdnLtejROcM3DgMULmjx6a4bKIQaoaYzxhbsgmg/3IOCXLLbmR
	7eilvaehU+AFOLq1DS6L0kAMD+/ub3NXX/WlR85mnBuc5ndDL7C5hKfXewFbZPGyuONlYn1aWsQ
	Z1Ff7Be80bBS2X9gztaFV7fWHCBt/csjdWmGlxXoU1
X-Received: by 2002:a17:90b:2e10:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3b1b0a40386mr10423649a91.13.1794833573456;
        Mon, 16 Nov 2026 04:52:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1d1d744e2sm2731930a91.1.2026.11.16.04.52.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:52:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so2324277b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 04:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794833572; x=1795438372; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saDXMzIo8kiOjeM1EMS87QEGU65zD4sXBIp4fj/XDzA=;
        b=d+RZL6ny/QOm052mhrSuB9hXhlkaWA8cUz7em6wuR+cc4qn5ZTJOY1IvC//8cZy7fV
         f6GVmzPt3mZxtNkyUtTJVrJXYZf/WZdGBUn6P8unITWQrQLd7xSSu8kldZUKgm/g2o1X
         Ae1W/OPSItrV8MbepT1ZGWW2vFc5XEKirVIKU=
X-Forwarded-Encrypted: i=1; AL+hErHC227neMUs+nihJaOI2NmuX6X2UX3dIi4MjuT8wsMQFbdv1DlcWNO5zygUuf8Ok1cF6tcb1CCSOZ4=@vger.kernel.org
X-Received: by 2002:a05:6a00:94e2:b0:886:458a:42e9 with SMTP id d2e1a72fcca58-8beb7a215b4mr8976127b3a.49.1794833571735;
        Mon, 16 Nov 2026 04:52:51 -0800 (PST)
X-Received: by 2002:a05:6a00:94e2:b0:886:458a:42e9 with SMTP id
 d2e1a72fcca58-8beb7a215b4mr8976113b3a.49.1794833571334; Mon, 16 Nov 2026
 04:52:51 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116074849.475815-1-stefan.chulski@broadcom.com> <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com>
In-Reply-To: <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com>
From: Stefan Chulski <stefan.chulski@broadcom.com>
Date: Mon, 16 Nov 2026 14:52:38 +0200
X-Gm-Features: AclHuK9lYUd8y1LqoNm1jEUvWpEAcJYPxDr98Khy91qci9OKo3WAm_R4ih0-tig
Message-ID: <CA+Fu+LPL7xqpV_vjjjehedOFtuuBqgZHZTSqJ+FgweUpYo2uBw@mail.gmail.com>
Subject: Re: [PATCH RFC v1] ksmbd: add use_unbound_wq module parameter for the
 ksmbd-io workqueue
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Lifshits <ilya.lifshits@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000007e78460660644133"

--0000000000007e78460660644133
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 2:10=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Mon, Nov 16, 2026 at 4:49=E2=80=AFPM Stefan Chulski
> <stefan.chulski@broadcom.com> wrote:
> >
> > The "ksmbd-io" workqueue has always been per-CPU. Commit 69635d7f4b34
> > ("fs: WQ_PERCPU added to alloc_workqueue users") only made that
> > default explicit as part of the treewide transition to unbound-by-defau=
lt;
> > it was not a ksmbd-specific decision.
> >
> > Per-CPU work keeps request processing on the CPU that queued it, which
> > is good for cache locality, but it also runs work on CPUs that were
> > isolated from workqueue noise (isolcpus=3D, nohz_full=3D) and prevents =
the
> > scheduler from placing blocked or long-running workers elsewhere.
> > Which behaviour is better depends on the workload and platform.
> >
> > Add a boolean use_unbound_wq module parameter. It defaults to false, so
> > behaviour is unchanged unless it is set; when true, "ksmbd-io" is
> > allocated with WQ_UNBOUND instead of WQ_PERCPU. The "ksmbd-break"
> > workqueue is already WQ_UNBOUND and is not affected.
> >
> > Document the parameter in ksmbd.rst.
> >
> > Signed-off-by: Stefan Chulski <stefan.chulski@broadcom.com>
> Hi Stefan,
>
> Do you have numbers comparing the per-CPU and unbound queues,

Yes, on our systems we observed up to an 18% performance improvement
when using the unbound workqueue.

The primary reason for this improvement is that with the default
per-CPU workqueue, ksmbd-io work can sometimes start on a CPU that is
already heavily loaded. Because it is bound to that specific CPU, the
scheduler cannot move it to a less loaded or idle CPU, leading to
bottlenecks. By using WQ_UNBOUND, the scheduler is free to migrate the
work to less loaded CPUs, which significantly improves our CPU cycle
efficiency.

> How does this compare with the earlier following RFC ?
>
> https://lore.kernel.org/linux-cifs/20261022092514.2590010-1-huiwen.he@lin=
ux.dev/
>
> Thanks.

While both address the underlying scheduling limitations of per-CPU
workqueues for ksmbd, my patch introduces the `use_unbound_wq` module
parameter rather than changing the behavior unconditionally. Because
the optimal behavior (cache locality vs. load balancing) heavily
depends on the specific workload and platform, this approach keeps the
existing per-CPU behavior as the default while allowing platforms to
easily opt-in to the unbound workqueue when it yields better
performance.

Thanks,
Stefan

--0000000000007e78460660644133
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
+on8kJB/PnAxkj03/27iq+2cUc24qOys/j8E0+8b7g8IqeBaIpwClphXMx05qyEBoWMAIpQLZbkr
OATk694WJesPHv9odFrMQtDbCLh16vurgAd9Qq6mgitZPPT/GHV13zkVnDcZWG4aDngDu5ndfy24
0TvBvFiz97uV//NoG5MT5mkYufFR7tyBwvBpDXUTVfngSJoqcaYQp1VFSBfcxcwHZrHAg0JIoAwz
hB4nFy1Atlx2IGORgTec+dS1Pqb/eM9gFpM7GIvVcUZJeo0CAwEAAaOCAd8wggHbMA4GA1UdDwEB
/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0
cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5
BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIz
MGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsG
AQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4
MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmww
JgYDVR0RBB8wHYEbc3RlZmFuLmNodWxza2lAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUF
BwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBSA6GJTxU+RxobV
IBVB3gwY7k1pCjANBgkqhkiG9w0BAQsFAAOCAgEAKfbTNIK78LyptWReJFdtRrzB9gx3Jofx6oEu
aSkOv5+3/KNAtjL+sY/p0my4x5xAr+mHI6MNDedzID49xZdmI5u3800ZMGWXmrbaRpWmfo09/wOQ
xGZtfLy1H4piX46qT1DZkmiQtQYkaa7xRI2uiYZdllc+582mK7AGYmqPQFqbh8gX5DvxFV3kq8O0
0gsh5AIE7tRHb6VfZ3JCjxTqdiwL8WnTY7FslEK3p4Wc2A7ZxJM6amC+a2W7OqJGc+g/V/u9FZrO
RhtLtawYf/avRo5+p+cjx4rwXN7jN5qK28puewzFfxLTUsUEkyuICNEBK1xfUjeRwLrIN7M5+PDK
j66gi0licY/V9HrmbDOWh0bLATQTchsWZhY9Ih95akVDxnojrIHWohI6/ErCVV/G8qxL++gYG/rF
cW8Vyymevyu0yuWWLQYWWUONLwyXXNax3Nb+5gBB8tZnS/ByN5EIRsD9bWBk0Tq/P8cAfgpFyZiX
Zk/VjquAbx6WvASAhn/DcOGK5Uv8zH4HdeP+28/g+3owRPfiAppmcf4PHwoaxLA8BxVxvGh2Picq
y9is+1FwS9+fDcaMBLN8gZ/2OR0AYIekVjw4CASYMdNqfA/hvArgxjbhU/NhnxRTJ8kPZE5HCzyJ
/umztNrpaS8TJ+9J2QY2KsZTT3BQzF0AEejizDwxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBT
TUlNRSBDQSAyMDIzAgw32pL13CSveOhTCOgwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkE
MSIEIAvuchvdb+8v+FOrs/F6LepDcrVis4lcasz9bhXQpM0hMBgGCSqGSIb3DQEJAzELBgkqhkiG
9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MTExNjEyNTI1MlowXAYJKoZIhvcNAQkPMU8wTTALBglg
hkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0B
AQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAAuv02rND9B+Vl9jEXwbinHxaPYb12Gq
kUdDUrZenhh985Dk3FqzyKfO1JPOVwAokAb3yVGR0zCuijNN4oF4b6XyzXsiTwELh8PXD+tWYoCU
5efTSRWWwoNyrg2JbPZ3lB5gOTpjVCEAKYpX+9RHZra7RLMemJwiwL9a8FRFMkEr6Qock0wxeVze
m++lJKFWeqrEX8XZBW3dUfcW+7Y7czrSy4ikcpyRmsK159K7cPdX73vGhCRxWpseyrQhpMdTSZiy
xrf5TlKxJiHUVjxH4C9ktw3qaSrio8ON7tJzeO9yTLH4ASdmYxBeD1IcXjJYSfHa8woN4crDF5j+
V+NXU9E=
--0000000000007e78460660644133--
