Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230720;
	b=aWiDf3H4meR9RMEyBFyhcIsh0KYsAyOi1GTJVfEJBFfbAmKAusF5mCTyO7TLTxzN1xQy
	 W9Dc7x15qN9UCRVoaJyfFSRXPYUKhUwvUgaltAyQ+/PRmPs3t2FhQ2GFFW3znlzF5lXYf
	 3WVQ83IucLBzUFmSHzXtLX3RHRa5gZb2ym9N/PpGcIxBmc286tbA2SiFEpAdRH6etFU58
	 ysFER97fx8WjMzVW3lrV38EKTYy/YYMsc5xZXoU01+ocT8p852H255TT3gqAEU0oqLzgX
	 PR9g5c5MQIQdfe1QpIZNXloePU+1PIvmQQtnMvRhmLTDtpKeZLeu5F7Bpw1/5hg2fTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=n5sfA3SZFOIvKjYmGeq7v7sBZYxGPPKHgjsgmpGTfYY=;
	b=Zw8jbMY05FJS6HbH9aLKuUzoh1QQGFbqNE6JfQubiaLgyHptIqKJZNf9lV+UycuSx7vA
	 8Q4vCnLhRJwz3TRR1iCkVU1rnvyy+1BDkXSLbUlgmq4r7XIecc3T0gnHEcVpnRhjgSOSy
	 uIcU1O2PKyjDYMcKQ9xHFzq3HJwAA8E1HK6WP+eSm9OedIMTpWYT7La0/Hw7OsW/c3lZC
	 s3GpfNzI0wZRlHms04sOrVjsshcYh537RwqiV6FranuRf1F3BzSyTfri97W3nnPB6O3Mp
	 psH8uQyuHd4F3lyJnnYjoHj4AQ3ObG0MhvQrsv6kvdYUWASWyPdgmbPd+S2TAZu6Q7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5NZW79F;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09FC606A325
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09FC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5NZW79F
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91eb7d147b0so3572556d6.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 05:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230719; x=1794835519; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n5sfA3SZFOIvKjYmGeq7v7sBZYxGPPKHgjsgmpGTfYY=;
        b=J5NZW79FNr5PJz7kB2vKb2+dmJoGRj56JX9udk5697EYv7c7BK0VzoFseWh1sRihBx
         /flOUwR6OFIiXNgtzvyNK5oP3AHMpjo+0eSwqYoWawHTj+AjzK4SAEJd7h/fpwaXsUnH
         tx4zBPZP0g9vjTo5RTuW56TzS2BzRtBRLCn758WHvfaV04ZMlds1+J6jifXjnNxmKWK5
         QlxNg/XVSVxGWB8uEmrKFkgEF27I+aa7u+tkQbLnm92oJ1GyFU6YaUDGw7HJoQGWHQ6l
         7giQs+29J2IdvxrWirKLlnFIyTV/uvldUDA6wX4151jAQ1/RzgPgTvu4cJh0R797oITJ
         rdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230719; x=1794835519;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5sfA3SZFOIvKjYmGeq7v7sBZYxGPPKHgjsgmpGTfYY=;
        b=H1MiVisJvNy8RHu+24RRhNxWna0sv+Ap6ynG8QGr78IJ/xjTje2dqvtI7+DGY69vA0
         6/IkLVu+D3lASJEt2DFwBHjTxmPIwLzPvYyVMjOftyIRigwNGPh2+ZM0G8iORWuJcl1o
         5EKbMw5JiTnXEozcAoOJNsUAVnVGRdaHS8AX4+uOBC1g7if+LZF4Qw/08pfoKoXX2I8q
         ixFtyI0Ctvsl0nJc9DKzFvb8qAI5logiuU5Ur2GB/dk4DYzN7Tpt7zN1XqsTq+lhT0Vg
         pr+8DA14h/YwEdHwPAiqRVJZ/e4JLzFAQsm24kUSoLRFd8w3seDjQJBYcWght41DzTty
         wfBA==
X-Forwarded-Encrypted: i=1; AL+hErF4pxc7gy5tTaj6NNXPbjy+fC2E++NwkRn5EsZ60W11zEqMTxJGeSxQ5bwyW8oVIUNIhiFGuJ7iUdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CdspodarXjUm9Lux95UQbgx1NePNx95zlMfKUOI3Ui/h2CXZV
	motJfGlCMduNcktReO1jyMR2dVbgGqOR1lZQMFYhQT/xwlsRlrmSlTqz
X-Gm-Gg: AYBFou3UZ8bmp5JjCBaZ7RN0mYSYahIz+nYADSgXbtt9zvYJYNOvZUsXWrmyHsmfTYf
	tI/kX8JY2avuJlLmMkaNO3b/itHiYI1drndQyzFAmwPsdJ7nMKzcpBjV6r6D9GtCX6EysKTVuKL
	7WRFYpi2H1dgvLS0Qtxukt2CI4c63uL6rJDPcPyP7TMMHiOdnevgohHpNA+YQHtxO87q3KxrGaX
	wPHXh3fCQ3Nutr+jcZ+wxBvFt0NqpaNvbO3WFQ/W31Icu7hjL1UptyBP63t9oIUta20Vq+yWRBC
	FnPUwmhz0btvuEvWsQcAQ84VYsR4lmiHjUlrOlyofrehg7ncYil+9rt5rYTPpnlORysQuD6A7hC
	CjzagksRL0gML0SUFu97OrV+3dF/TY8PXlVtV9sRoVLcWT+DQB3Gl5aV+sAL+n6F7M5wdCD8oaX
	sbSyoVDs5nyE4vUSNwY9sXCJS8V4EADGuftLNO/XX0tHSibrmrTQ0ZUvGzfnRVnOcawiLLRiFzK
	LLsqSdFN83PsH1sUISVouS/F6CLJrcpOHHHkj95umUO1CdhHeKjHcb4xb2KPBln4m0PtSg36UK8
	oSnWDiEePTi9/BKOuNBUKGmAUkKP0WY3bw==
X-Received: by 2002:a05:6214:19e6:b0:91e:9564:6bc5 with SMTP id 6a1803df08f44-91ed24659dfmr56542736d6.39.1794230717677;
        Mon, 09 Nov 2026 05:25:17 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ecee77f2bsm42145486d6.35.2026.11.09.05.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:25:17 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 08:25:16 -0500
Message-Id: <DMQPPFZ838LR.U3X8GICZQTH6@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v3 5/5] selftests: drv-net: psp: add rekey
 tests
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106-psp-v3-5-a8dd38f5a727@gmail.com>
 <179408517003.994134.18139473201924553095@kernel.org>
In-Reply-To: <179408517003.994134.18139473201924553095@kernel.org>

On Sat Nov 7, 2026 at 3:59 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] In tools/testing/selftests/drivers/net/psp.py, the second half of
>   rekey_both_sides() (the "# now, tx then rx" block, lines 734-736) does=
=E2=80=A6
>
> --
>
> selftests: drv-net: psp: add rekey tests
>
> This commit adds psp.py selftests for rekeying PSP connections. They cove=
r
> basic Rx and Tx rekeys, plus cases where rx-assoc and tx-assoc should fai=
l
> because of a psp version mismatch or the psp state. It also adds rx-assoc=
,
> tx-assoc and key-rotate RPCs to psp_responder.
>
>> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/=
selftests/drivers/net/psp.py
>> index 71eeade62ad24..004faf4bb57ae 100755
>> --- a/tools/testing/selftests/drivers/net/psp.py
>> +++ b/tools/testing/selftests/drivers/net/psp.py
>
> [ ... ]
>
>> @@ -489,6 +558,186 @@ def _data_basic_send(cfg, version, ipver):
>
> [ ... ]
>
>> +@ksft_variants(_get_psp_ver_variants())
>> +def rekey_both_sides(cfg, version):
>> +    """Test rekeying both directions"""
>> +    _init_psp_dev(cfg)
>> +
>> +    s =3D _establish_psp_conn(cfg, version)
>> +    try:
>> +        data_len =3D _psp_txrx(cfg, s, 10)
>> +
>> +        cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
>> +        _remote_key_rotate(cfg)
>> +
>> +        # first, rx then tx
>> +        data_len =3D _rekey_rx(cfg, s, version, data_len)
>> +        data_len =3D _rekey_tx(cfg, s, data_len)
>> +
>> +        cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
>> +        _remote_key_rotate(cfg)
>> +
>> +        # now, tx then rx
>> +        data_len =3D _rekey_tx(cfg, s, data_len)
>> +        _rekey_rx(cfg, s, version, data_len)
>
> [Severity: Low]
> Does the "tx then rx" half of rekey_both_sides() check that either of its
> Tx rekeys actually took effect?
>
> After an Rx rekey, the old SPI stays acceptable:
>
> net/psp/psp_sock.c:psp_sock_rx_rekey() {
>     ...
> 	pas->prev_spi =3D prev->rx.spi;
> 	pas->prev_generation =3D prev->generation;
>
> 	memcpy(&pas->tx, &prev->tx, sizeof(pas->tx));
>     ...
> }
>
> psp_pse_matches_pas() accepts packets that match it:
>
> include/net/psp/functions.h:psp_pse_matches_pas() {
>     ...
> 		(pas->prev_spi && pas->prev_spi =3D=3D pse->spi &&
> 		 pas->prev_generation =3D=3D pse->generation));
> }
>
> The old SPI only becomes invalid when the device key is rotated:
>
> net/psp/psp_sock.c:psp_assocs_key_rotated() {
>     ...
> 	list_for_each_entry(pas, &psd->active_assocs, assocs_list) {
> 		if ((pas->rx.spi ^ pas->prev_spi) &
> 		    cpu_to_be32(PSP_SPI_KEY_PHASE))
> 			pas->prev_generation |=3D ~PSP_GEN_VALID_MASK;
> 	}
>     ...
> }
>
> In the first half, the key_rotate calls that come next cause a stale Tx
> SPI to be dropped. The second half ends right after _rekey_rx(), and
> neither side rotates again.
>
> Say the local tx_assoc in _rekey_tx() were silently ignored. The local
> side would keep sending with the old SPI, and the responder would still
> accept it through prev_spi. The same applies if the responder ignored
> the tx assoc sent by _remote_tx_assoc() in _rekey_rx(): its echo would
> still be accepted locally.
>
> This half is also the only place where an Rx rekey follows a Tx rekey on
> the same socket, which is the memcpy of prev->tx shown above. If that
> path lost the Tx key that was just installed, would this test notice?
>
> The v3 changelog says the basic tests now "rotate again after it to
> verify the new key is in use". Could this test end the same way, with a
> final cfg.pspnl.key_rotate() and _remote_key_rotate() and then another
> _psp_txrx()?
>
>> +    finally:
>> +        _close_psp_conn(cfg, s)
>
> [ ... ]

Like you said, the other tests were changed in v3 to pick up this
coverage. This test was more about crossing device key rotations. I
think we can let the dedicated rx and tx rekey tests cover this.=20
