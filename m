Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188020;
	b=C6KQ4sepaqAgl+/lI1ajWZ8ZiO31525sIvTxZg4eW30GHFi/jSrNAoT0tCVa61wnP2Io
	 tKxMclaYwAwT8hmETN99HOXJuf25v3bZG0avdFf2uuIc9WZw8iC88TYAeqa1RNXy+2+av
	 tV0CK/PgDKpIMSCVDHAGwR59tLJDWQc8ygA/pmpzzlNvRCQrz5SqC5OYn3Co7eJj7iOKj
	 yqgSH7W1HxXj17maHgxiVB2UBpmLsCs5K3GdH16qL0grtIIguWFMRM95cVfF0CFsuD+Hw
	 g3NE1RLqxB9tsAbxfeFihouKpc3PvaliKCR/h3EzQPASGTOEjhmypKoYPPx1MyYYPkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188020;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=KckakJANrMQ2rKdzZUs0WXUNu9cRpujfwzp+HbNKBMc=;
	b=KP8t9vc3lXzZ/uXri9/qMPvM3XUgvSP69Ym3Xr4bxhpRmZ41ZofY2RgjA/pGMzwnzZna
	 eeoScHaoWR8p/rjCEoCzSi7ofLYL3Yq0rnWdT/X/e+sRJKtu47NG6YsnqWmbP+ZXYe1A5
	 JpUO/HYVQqwdjseq1SWqM/wx44ZaJ06ecntPtrUhaLY4miMcgDDgfAXw1+ODfFyIzKACG
	 0GL63P/xNQfL8IyH2MH2TZ2RNuod9dFohEUwf/kNeC8kgKo9ZQKIN6y1vNWaCeZXO9LPD
	 imWr4e9NS8DVwKcxTppGWRKPc1DHzzrCG3YmHiUqzD8hoh1ItUz/wOhens/DKUSb/Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FlJoePI3;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BB4606A31D
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 11:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BB4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FlJoePI3
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so395497a91.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 04:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188018; x=1793792818;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KckakJANrMQ2rKdzZUs0WXUNu9cRpujfwzp+HbNKBMc=;
        b=kbPZ8K/9DOFjxIXyt+eQPVaPHlkiRYnKqHQJ8v+1ObBcp9pZPadBjTrT9QFSGqmk0I
         Ma7xLt5edFlf8uJmKb49sbjxLf6UVNMtCzJcfB/Cio8m95yp7xRx0Dqy9qlGYEzjaKCA
         0j6XDkZmjunsCWWg+026+EgAAPlj1dS+VgH/TxCa6K/igyjCdtXf8aEWEwkATE1VhpnT
         gCr1ptXXZOzd/+D8ddjFJTYQeiQAjeH0oeYInlb6WIAlLwg2GOxUx/3ewzOAYabOWwJi
         vhJKhXuXo7E6DrmtJkxvwpUdDX2C75cljgP7PAgWgvtRSwOnDEIdMIINwyZo8HbofkTx
         6x5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzncYG04xbtzbHMMImcCMMJaC+sPjK3fAjzu/8Rl7qicBMSOJSsf/ODYpncQURlpQ95dx3PoYTWAko=@vger.kernel.org
X-Gm-Message-State: AFq9FYL61STmhVBW3D8xsN6won7UbgoRXY4dJ+TBw6xecrBKZOFB8QDR
	5c4qzUCU6+kHiWfwSMIXK4FwZrpWmK52oGTUTCs54/9yiwTFPEIRf/YGLW3RGXS3cw3pIXJkB3z
	WNJOtFbyLtdFRixcthZdbd1mIpDOZNFsEWNAuiXvR2xQPisatgvoj/HDGkrfGgN4fyqIRnE5JBf
	HqIrTEtV93d0aNt9JT31jBps/BLhPJur+bKy+7T9pkUBeYxMNHXpNyTGWSPuZxeklQVx0zLiyUL
	grL3lN5kmu2Xw==
X-Gm-Gg: AYBFou2Ja8TbrFdSh42RnLT3qdedILScQ7NV3JDw7U9aU5D44hIDtl7Zzae2Wf+9ZN6
	sp3oUom+pAHjoRbKvVkFhESwdA1cxCu5LRZIYyowaBthT5Sy/moSQJPnz8jH580iNxz/F8PqlRS
	FQwvYMwPZ1Tn7pgmia3f/2LJa50guVbW+sBJcMEQbqW0tZmpND3cwHM9ETyHmNaBtlnciLKyaOS
	NKXdLJcO7IVs+JxU+Rds0IWf6d+8WqaiBtal/5kZZ+xE34ph4NmEQ+FvO7lv4I2voYkxYhr6Pc/
	5ukpbdgMAxPoZLT5qzBhqv1tkr0qqDgiA2Iaw7pzzLe0WTdHERDWk30IcpM6W5de1OiG8Sd4XyR
	JmLk9vTjhzQyA6lJm1QPfqyBgDRwPfENMSfEQZaN818D/IIiIAYQMDptIv5F7Ru2Y+3Ur+21lcK
	tF4rlMYlXzUTult+1A1nfL1qSdkHqjoauu9A==
X-Received: by 2002:a17:90b:3e86:b0:3ac:a11a:7c79 with SMTP id 98e67ed59e1d1-3ae580ac6b2mr1411417a91.16.1793188017794;
        Wed, 28 Oct 2026 04:46:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae5a55eaefsm1395089a91.4.2026.10.28.04.46.57
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 04:46:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd6969473a4so568337a12.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 04:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793188016; x=1793792816; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KckakJANrMQ2rKdzZUs0WXUNu9cRpujfwzp+HbNKBMc=;
        b=FlJoePI3+ar63KEb+IiXDYufCe5NdIdGt2jspA2GR6hFD8qtdQGTwLfZx0P9AbqLQu
         VZNz3fzKpmjD56aQIY/zhSia4SSBNH/eOExo3SVKnJVjijPjkepf9rmNhFFnc7VTR7oQ
         OKFtN9PAQwVhHgdtAcghw5IH1ZDTUpVqJcMyw=
X-Forwarded-Encrypted: i=1; AKwUvBzrTWZfF+0KZkbKoty7nqTkWuNRiGEDTCv9YKaAfyuO2VBgpnNxF5Vw9oL7WgbXsiBN6ZOmwI/W8xY=@vger.kernel.org
X-Received: by 2002:a05:6a20:6a07:b0:3e2:7d65:b1cc with SMTP id adf61e73a8af0-3e9023de832mr1983193637.51.1793188015920;
        Wed, 28 Oct 2026 04:46:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a07:b0:3e2:7d65:b1cc with SMTP id
 adf61e73a8af0-3e9023de832mr1983164637.51.1793188015460; Wed, 28 Oct 2026
 04:46:55 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009-psp-v2-0-5596ab50f677@gmail.com> <20261009-psp-v2-4-5596ab50f677@gmail.com>
In-Reply-To: <20261009-psp-v2-4-5596ab50f677@gmail.com>
From: Kiran Kella <kiran.kella@broadcom.com>
Date: Wed, 28 Oct 2026 17:16:17 +0530
X-Gm-Features: AclHuK8WaxqTC7G91_YpYCwqVkoDk00v6XyhptjYOm6zDQBcn6Nkyw9YlWIvFqw
Message-ID: <CAPHeo3erVfzLE0wTmz4=0HKWdOL63+7W2KXO67OuEfRXhf_M8Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/7] psp: add core tracked stat for
 outstanding tx keys
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000bac0a7065ee51ed4"

--000000000000bac0a7065ee51ed4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 2:19=E2=80=AFAM Daniel Zahka <daniel.zahka@gmail.co=
m> wrote:
>
> It is useful to keep track of tx_key_cnt: the number of outstanding tx
> keys from the hw's perspective. Userspace can monitor this to
> determine if there is a key leak (leak in the sense that some device
> resource like an SADB entry has been leaked, not that the crypto key
> has been exposed).
>
> It also may be of interest to userspace if a device is approaching its
> SADB capacity.
>
> Only report this stat to userspace if the driver uses an SADB.
>
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
> ---
>  Documentation/netlink/specs/psp.yaml | 8 ++++++++
>  include/net/psp/types.h              | 2 ++
>  include/uapi/linux/psp.h             | 1 +
>  net/psp/psp_main.c                   | 3 +++
>  net/psp/psp_nl.c                     | 4 ++++
>  net/psp/psp_sock.c                   | 6 +++++-
>  6 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink=
/specs/psp.yaml
> index f3266763c325..d14c11d09891 100644
> --- a/Documentation/netlink/specs/psp.yaml
> +++ b/Documentation/netlink/specs/psp.yaml
> @@ -190,6 +190,13 @@ attribute-sets:
>          doc: |
>            Number of PSP packets for transmission with errors.
>            Device statistic (from the PSP spec).
> +      -
> +        name: tx-key-count
> +        type: uint
> +        doc: |
> +          Current number of Tx keys installed on the device.
> +          Only visible if the driver stores keys on device.
> +          Kernel statistic.
>

Maybe it is good to have a counter that denotes the number of PSP
sessions set up on a device, which is managed in
psp_dev_tx_key_add/psp_dev_tx_key_del operations similar to the
tx-key-count. That way, even in non-SADB drivers the user can know the
scale of the PSP sessions set up on a device at any time.

>  operations:
>    list:
> @@ -316,6 +323,7 @@ operations:
>              - tx-packets
>              - tx-bytes
>              - tx-error
> +            - tx-key-count
>          pre: psp-device-get-locked
>          post: psp-device-unlock
>        dump:
> diff --git a/include/net/psp/types.h b/include/net/psp/types.h
> index 8ffc566cec2a..970801cb6502 100644
> --- a/include/net/psp/types.h
> +++ b/include/net/psp/types.h
> @@ -90,6 +90,7 @@ struct psp_assoc_dev {
>   * @stats:     statistics maintained by the core
>   * @stats.rotations:   See stats attr key-rotations
>   * @stats.stales:      See stats attr stale-events
> + * @stats.tx_key_cnt:  See stats attr tx-key-count
>   *
>   * @rcu:       RCU head for freeing the structure
>   */
> @@ -125,6 +126,7 @@ struct psp_dev {
>         struct {
>                 unsigned long rotations;
>                 unsigned long stales;
> +               unsigned long tx_key_cnt;
>         } stats;
>
>         struct rcu_head rcu;
> diff --git a/include/uapi/linux/psp.h b/include/uapi/linux/psp.h
> index 1c8899cd4da5..21810e8a7229 100644
> --- a/include/uapi/linux/psp.h
> +++ b/include/uapi/linux/psp.h
> @@ -69,6 +69,7 @@ enum {
>         PSP_A_STATS_TX_PACKETS,
>         PSP_A_STATS_TX_BYTES,
>         PSP_A_STATS_TX_ERROR,
> +       PSP_A_STATS_TX_KEY_COUNT,
>
>         __PSP_A_STATS_MAX,
>         PSP_A_STATS_MAX =3D (__PSP_A_STATS_MAX - 1)
> diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
> index e118b8019e7e..9f256157d88b 100644
> --- a/net/psp/psp_main.c
> +++ b/net/psp/psp_main.c
> @@ -169,6 +169,9 @@ void psp_dev_unregister(struct psp_dev *psd)
>                 list_del(&pas->assocs_list);
>         }
>
> +       WARN(psd->stats.tx_key_cnt, "psp: %s: %lu Tx keys still installed=
\n",
> +            netdev_name(psd->main_netdev), psd->stats.tx_key_cnt);
> +
>         list_for_each_entry_safe(entry, entry_tmp, &psd->assoc_dev_list,
>                                  dev_list) {
>                 list_del(&entry->dev_list);
> diff --git a/net/psp/psp_nl.c b/net/psp/psp_nl.c
> index cdfc2d72fb39..494022ab5a71 100644
> --- a/net/psp/psp_nl.c
> +++ b/net/psp/psp_nl.c
> @@ -934,6 +934,10 @@ psp_nl_stats_fill(struct psp_dev *psd, struct sk_buf=
f *rsp,
>             nla_put_uint(rsp, PSP_A_STATS_TX_ERROR, stats.tx_error))
>                 goto err_cancel_msg;
>
> +       if (psp_dev_has_sadb(psd) &&
> +           nla_put_uint(rsp, PSP_A_STATS_TX_KEY_COUNT, psd->stats.tx_key=
_cnt))
> +               goto err_cancel_msg;
> +
>         genlmsg_end(rsp, hdr);
>         return 0;
>
> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index d21f7afd830a..c458bc551b4b 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c
> @@ -94,9 +94,11 @@ static int psp_dev_tx_key_add(struct psp_dev *psd, str=
uct psp_assoc *pas,
>
>         memcpy(&dummy->tx, key, sizeof(*key));
>         err =3D psd->ops->tx_key_add(psd, dummy, extack);
> -       if (!err)
> +       if (!err) {
> +               psd->stats.tx_key_cnt++;
>                 memcpy(pas->drv_data, dummy->drv_data,
>                        psd->caps->assoc_drv_spc);
> +       }
>
>         kfree(dummy);
>         return err;
> @@ -105,6 +107,8 @@ static int psp_dev_tx_key_add(struct psp_dev *psd, st=
ruct psp_assoc *pas,
>  void psp_dev_tx_key_del(struct psp_dev *psd, struct psp_assoc *pas)
>  {
>         psd->ops->tx_key_del(psd, pas);
> +       if (!WARN_ON_ONCE(!psd->stats.tx_key_cnt))
> +               psd->stats.tx_key_cnt--;
>  }
>
>  static void psp_assoc_free(struct work_struct *work)
>
> --
> 2.52.0
>
>

--000000000000bac0a7065ee51ed4
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
ksPFF8lRQaSHMJFFWI2usTUpS9gKxRAuJyHc0xlNKy4vK2ZEic8RWs34T6LcL98JR51RaKtE0Dw9
7F/uUf87z+/74aOyyxrTl58LlkxL/+1yMEHZhyn6z30LHQuA52TSp7uD3au8gu0YN+hKIsPBKVbs
dzf/bW6eDpGSwgwRzqF2BcDBOUA9U2mB2cxinBxOxCVbYRy//Q46OuAx0pXw8trIkPDdp8kHAoWD
7JxJ70nrdMy8VRmC02NQp185/6szeMFYLA0CAwEAAaOCAdwwggHYMA4GA1UdDwEB/wQEAwIFoDAM
BgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcw
AYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIARe
MFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZo
dHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBo
dHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIwYDVR0RBBww
GoEYa2lyYW4ua2VsbGFAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQY
MBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBS/iTArBeV9hFyyktvkwzGbaKne3zAN
BgkqhkiG9w0BAQsFAAOCAgEAdavxLwcm6Kj3S7/bA/IO6B6MTHIndKyB630T3CTPeOeuHV7ZS4wr
rDZbrSjERD36308lnaXSESlcu8LX2SKJ0KqNM3VQNTawSKS4wMXlyTzOBfaslsjtFiT4jQW9Py6u
6nf1EVoQ6YTCGJ+htyKqFgIljJIdBBOvXY+gECh/DC+VbLUVK9CgZLKkFJ5udhYvw1tOc3zOXGOd
kwaK7AtwRSLgNt5RSAaikL6bvU1kUWgITNKKhBK5F3CNUbR0hD/i7yG6Afdh27V1T7FEdV07fBbu
3+AVnAdbZmHfnB2T8lHTaR9GbgkF6lG/a8I+eUG5NPrDEM+afXT7/+zOTjf799qoyhMdfgp90DEW
9ukfyqfUq37ctBG4TdnDlxtkwy9XYw0Avotf2lrYy+6MYjt3cZFF+AF/F6ANk+Gx9zH5gyeUlruJ
+aqmP1U1lX/n2YEXAfiLJulbb3Jfi8lvyYzHXpHLIFtLfyVOzUXdGdj3dVxxFSPJ4uXmpk2SLExM
W7+cvJ+PxSJyWK723U609whQmqbVRz5B49CjNt/exjWtBGGjCwLPMGNWbHbwtDVWcoZzE0KoL7EK
VPB0t6uom5ElZ+qieZghO80tR/MW2eL8i+EiVMwq5GF1Ni3D6uypwZYqgdicI0YGj7JCgrIzr1kC
xwtQkw5ij2CCUWXxadt/C9gxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBH
bG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIz
AgxbhXTUwXZ3dIWSpigwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIHCngfnsZ9Bc
lihFrpGPLfzVL2Gy9hvuVEHHtSZOiEZPMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI2MTAyODExNDY1NlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAKG/jGCdsIFB6PkZ2TY3YhLJY0NdXTfHg8gmU9W6IJqZlI0n
LR0/mLcQfs3nGAMLESTiqhg/ng0PEC78ItoKy8pCvl08fwCx0MVTuHrrShRCFNaA6ur0RBv3NSkw
Whmsubcc/ivyaetvI5lY7NlS2u+p8kdTxbBgi6ZkFcfXTkV3bhJGCDhw29cKCcIM2B2JKvOhuNW4
KR9YYQfxjYXs11nD36SO8eAww7ArL0qI2XympNhyRGRNoU54aU/LL4NNFyPvWbNwGHk8tfYFQ5fu
wy5DYlEv0ZI/0rBXH9nLDJqhRdGti5g8zKyjveC/mYhGq++q6Xz2Rvf3jrbvneArg0Q=
--000000000000bac0a7065ee51ed4--
