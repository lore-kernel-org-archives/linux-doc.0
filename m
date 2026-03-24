Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C7350A37
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 00:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.228
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774313280; cv=pass; b=QpexRIE5jeJ4ekLmJ8dz1eeBW9KwtKO7feVfNO3Zn6FXM/+e6Al006/9BuKmcQ4yxBuBYMy52QpdXhTvi1wbelhm8tVwigbI6nPVOcXGsnTmWHBkuK3wJn/Sg7eRg93UrmAAUUGVYtXz2Rw/Nq3Buuo4rWNjOzrJSwdXDCRmRRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774313280; c=relaxed/simple;
	bh=uR4tdkdS4NMbovd2TP44LodVEmjSO3byf73ylewOybs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i59dCrlXphBV/NMnOPgadxGtEslqXiEok06t2oFrszKCNOdzst+8ETB6XHuJPapOL8uQ/e+XBREqA7dDkToZIwlkiI0Xd3SLNyD+2oo5zCejQT97LCwwc5HA1VxeENXvpi1YTB5RITzo3gSIGwvI0xvR2ViA7bW5mjPeJ8tGSjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LCdLfozP; arc=pass smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LCdLfozP"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2adff872068so15457575ad.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 17:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774313278; x=1774918078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uR4tdkdS4NMbovd2TP44LodVEmjSO3byf73ylewOybs=;
        b=eVNKMI/eEY6PJ2hws2PB+KA4GwWRvkzzwCBnJsdUWGNMNN180nLxtzYg2Yx6qijuef
         9NO3aCsCWO5D0VrCSfzI9TTuW9/IXCuURzwAJd0tbys3gJWTnRnfP7wsigMuGyQ0EdhM
         m/beRimeUPTNZh5Qq9RzquA5PImDeFPmgDjgmVvcnBAfl++zvt3jTsmY+djmGEfSBe73
         E0Yv6eOQ0pYAA75NWqW9ukVftWGTabyBX0zEw8TDtiI3JUNEVAJwSOC+EomJAlnvYOlP
         ohJzgi79Q+ytXhdh4xoZyno4kGGiC2292A0OkDRxxRta0wDjuNwk66lIOYxcgp9QgYgn
         WoBg==
X-Forwarded-Encrypted: i=2; AJvYcCULxouSxS7O61dIJsXBH3FjROYdCwBLv5x7dICPkqCEidSUhtwoGyeXBeinaQ85q06c6tcsFqmcfmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw6NEsvtg9RMKIafnyIvq85wqDYU3SmTvwvhjQ/3XN7fHK9OM2
	t2ujVGoWiBETTeRzrIJ1AWjwyr1KUXya4qIrYNOOrbUwbolwGz4ntv8L2m8DBN6g0MB4Z64XYu/
	HWk1NAPxaIMtiyam3B7PEweZyVpMyDUnQ9YlY1jzgOz2eko2iTylENzY1D1acMYGf5j/468of+2
	eMj7muqVpLyVyGnabcc/1q+dvOeHsCeMRwzhSAFM8IP3+7SgGzgkRnR3CG0K0/qEikOleUAQ/3E
	sJO7o3VQTrY8ew=
X-Gm-Gg: ATEYQzyMkNQztGmcwoL5WdCHHmIr6/zx027YyqWpz0Rca11OKQEv2xOo+OFV09T+KJS
	NMUO561SZhKqvhqGoSQr1uN3yVEYWiV3sSOEAsA0UuI6ZFIIy8sU0qcJUAfJxcsvxr140tvYs15
	W4vfdtk3ihW7Aq42751xJdQX+3Y9gZVnlitcnYyRljEwJjwVF7/XoDpc1s7pS8W2oW7qes3legL
	jJcPeVVD9EwuUZ30gr0Cn9yoQLhbC9X+6IZ0GfXHBtfI9i7qumRbZfWXGKz+8SJDWScSFDG95ae
	WzDtcJIIVAnh3o9cXxAZUHCB8pVaqpLG/TxbSxsFh3uJB3lXkZfQ9JWYaepth1segiTdw2l4jAL
	On0e2xLRlfhs3GiClGOMxzG0YneE8FB/Tr6K/U7AxznXkakmnkeB96gtkVfYIjYVQI7zfLRQrgZ
	inBNSqjFwR5gmtmnJEzADoPOXQXASP4RKL6HR/jg+rjmBNwC9s2Oc1NDCGX28=
X-Received: by 2002:a17:902:c950:b0:2b0:7509:1b25 with SMTP id d9443c01a7336-2b0827d0540mr140191445ad.37.1774313277812;
        Mon, 23 Mar 2026 17:47:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b0834ee80dsm15681525ad.4.2026.03.23.17.47.57
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Mar 2026 17:47:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6676eeba186so3706632a12.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 17:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774313276; cv=none;
        d=google.com; s=arc-20240605;
        b=bFkoVF0HVuoW+ZrpPZJtxTf3hTpq9JkbYzIm5qjYNCSBlQ8QMY1wzwkzuR1N/GLjb/
         j1bm4vdv3vih3LKT+3D8O7/H4suzBhgY9pULV8vnhgFolQWAaHpjl0WnD1eZ6RuIph55
         kYsJ3pPMGi8lNn59RX6gTde5P9Hc4sPrDUPIlc3Q5yXRHF+D0pmV/Lb1LipG/l5qHTVL
         TepZChDQbR69y0hX5zUGpk7W/be4hu7lk/pAEYBeUtRRDL/XGm3IMCZMQUHyXSy4vkmf
         P8NeHevfrWXR7hOTM3R0ah5lzZ0qr90m7asjbgAITa8nOmUvIGC3jDdJHw4o4chEqO26
         AxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uR4tdkdS4NMbovd2TP44LodVEmjSO3byf73ylewOybs=;
        fh=1qwKP0EzzC9jZPhoIM4ZiDcyfiE9PmrfiG5Nonie/Ts=;
        b=aUDOkdzt4MZzCHXL6X3H+yK3b5Bxi5An7YaRBX+y4zD4hpTbc7RYHhfJm0gFFL5Ji7
         qHullGeDSIwzan+zzo3ecijUh+UgJ2dNMEXtDDSZGE/wY4Dr2Ce3EgFtP293v1D5H8RA
         sohaphD40DeuF0+Q9WE7NlPJk4ZRLX/VtV7LY+5lklPUHvrpo1a++o88pvFvaOuQqn5L
         Pr26DN17mTXrCHuePkagDBOJGKBvFXQlW0P7U2DnX3JKSNIf/aX1bUdysFmWZFjQowgO
         v0AWmpia2eNFKBExD+eDTOl5AqnUXg8QiVohTa9wKSNmsmOOswWrx9/LGRWLrl7aRN5z
         5nUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774313276; x=1774918076; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uR4tdkdS4NMbovd2TP44LodVEmjSO3byf73ylewOybs=;
        b=LCdLfozPS+hL6tUKZz8PEmcnEvXAqfoX9KhcvNAsUUU4JyJeMDTXJBSOruFQbkJjAL
         ENULBdIlJVOLaR0+gcHYYNv4BPRx5iF+V9ts1pKpKQ8kRWXU+ekkaElnztfbId0b3NLo
         ytQJEZnLLiEM9UtelNtlNUX32Z0hin8w4EP/g=
X-Forwarded-Encrypted: i=1; AJvYcCXgim4rhT6T8Fx+r2V3j0DbjW/3MsiH/WRz9HhzwXS76WycN1U9nWag7oFk1J9SahdI6e8Q+XGY6NE=@vger.kernel.org
X-Received: by 2002:a05:6402:4542:b0:667:ddf7:7d9d with SMTP id 4fb4d7f45d1cf-668c971954bmr7635452a12.10.1774313275844;
        Mon, 23 Mar 2026 17:47:55 -0700 (PDT)
X-Received: by 2002:a05:6402:4542:b0:667:ddf7:7d9d with SMTP id
 4fb4d7f45d1cf-668c971954bmr7635430a12.10.1774313275425; Mon, 23 Mar 2026
 17:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320012501.2033548-1-sdf@fomichev.me> <20260320012501.2033548-8-sdf@fomichev.me>
In-Reply-To: <20260320012501.2033548-8-sdf@fomichev.me>
From: Michael Chan <michael.chan@broadcom.com>
Date: Mon, 23 Mar 2026 17:47:43 -0700
X-Gm-Features: AQROBzA-_AUUB6-xri1Ls7aYRImwmpFhYIiqzLVvcCXA93ChCnVc1sxi6-ZS8to
Message-ID: <CACKFLimO_K4qRb2Tnio-0xa6U1xmTEbz0Q-rzC7RqygQOBLnpQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 07/13] bnxt: convert to ndo_set_rx_mode_async
To: Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, andrew+netdev@lunn.ch, pavan.chebbi@broadcom.com, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, saeedm@nvidia.com, 
	tariqt@nvidia.com, mbloch@nvidia.com, alexanderduyck@fb.com, 
	kernel-team@meta.com, johannes@sipsolutions.net, sd@queasysnail.net, 
	jianbol@nvidia.com, dtatulea@nvidia.com, mohsin.bashr@gmail.com, 
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com, 
	bestswngs@gmail.com, aleksandr.loktionov@intel.com, kees@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	leon@kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000008c5698064dba803e"

--0000000000008c5698064dba803e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 6:25=E2=80=AFPM Stanislav Fomichev <sdf@fomichev.me=
> wrote:
>
> Convert bnxt from ndo_set_rx_mode to ndo_set_rx_mode_async.
> bnxt_set_rx_mode, bnxt_mc_list_updated and bnxt_uc_list_updated
> now take explicit uc/mc list parameters and iterate with
> netdev_hw_addr_list_for_each instead of netdev_for_each_{uc,mc}_addr.
>
> The bnxt_cfg_rx_mode internal caller passes the real lists under
> netif_addr_lock_bh.
>
> BNXT_RX_MASK_SP_EVENT is still used here, next patch converts to
> the direct call.
>
> Cc: Michael Chan <michael.chan@broadcom.com>
> Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>
> Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Michael Chan <michael.chan@broadcom.com>

--0000000000008c5698064dba803e
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
DPVtLUtep/P3evQuAtTQRaKedjamBcUpJ7qUhBuv/Z07LlLIlB/vfNSPWe1V+njTezc8m3VfvNEC
qEpXasPSfDgfcuUhcPR+7++oUDaTt9iqGFOjwiURxx08pL6ogSuiT41O4Xu7msabnUE6RY0O0xR5
5UGwbpC1QSmnBq7TAy8oQg/nNw4vowEh3S2lmjdHCOdR270Ygd7jet8WQKa5ia4ZK4QdkS8+5uLt
rMMRyM3QurndiZZJBipjPvEWJR/+jod8867f3n0CAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUJbO/Fi7RhZHYmATVQf6NlAH2
qUcwDQYJKoZIhvcNAQELBQADggIBABcLQEF8mPE9o6GHJd52vmHFsKsf8vRmdMEouFxrW+GhXXzg
2/AqqhXeeFZki82D6/5VAPkeVcgDeGZ43Bv89GHnjh/Vv0iCUGHgClZezpWdKCAXkn698xoh1+Wx
K/c/SHMqGWfBSVm1ygKAWkmzJLF/rd4vUE0pjvZVBpNSVkjXgc80dTZcs7OvoFnt14UgvjuYe+Ia
H/ux6819kbi0Tmmj5LwSZW8GXw3zcPmAyEYc0ZDCZk9QckL5yPzMlTAsy0Q+NMVpJ8onLj/mHgTk
Ev8zt1OUE8MlXZj2+wgVY+az2T8rGmqRU2iOzRlJnc86qVwuwjL9AA9v4R13Yt8zYyA7jL0NiBNP
WaOSajKBB5Z/4ZVtcvOMILD1+G+CVZX7GUWERT9NRXw/SyIEMU59lFbuvy4zxe3+RbOleCgp3pze
q8HE2p9rkOJT3MkCNLxe+ij4RytIvPQXACsZeLdfTDUnjeXCDDJ9KugVhuqMelAZc4NissPz8FOn
2NK++r5/QamlFqYRhsFxSBIvhkh2Q/hD3/zy4j17Yf/FUje5uyg03FblSBOk2WYpRpXEuCpyn5pb
bYVIzfhQJgwGfO+L8BAeZIFjO1QL3s/zzn+RBlTl4wdDzh8L9eS+QEDhMcSsqb4fFRDbsoVuRjpx
R5MunSUzk4GcmmM19m7oHhPGeKwIMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCDQUe5+
MnF5gGNR7DKTscnoSulx7eb9g2hc5867TiEBijAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjAzMjQwMDQ3NTZaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQA82A5a/zCgoE7aNYo3a3h9KK5gAHJbcIbIEKXP1UiO
YZ/CuT++ELFmS8Zm05ECPgmPyHK3wyVZjYXmQ17PNTPa+nbuXahezcvHv9lP5b/m/P6wQeQSGZ6W
g/y/XDzfd8yEtjX8KzuVGheMtfzbECTHWSXxhVSOn9AvHFu0OWrW+6Rna+1cuO1CP+5COvpsgUP7
/lknTSHSX8OcA52tbFKwgd8oOu1GiuaULHkEttX5HFrf00ux5IrQqatxpbAfV5avd7G5dY6qQn08
JDIiMsNE304h5G4QGxRzT6OPZ1hXKBMMLUb/aUhlU4wlQ+BptcoZhjgyXEP56fIuGgJGPwjL
--0000000000008c5698064dba803e--
