Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329705;
	b=EqxxeO8xBn+YWFageQ6FrFsOVd+4JzH1HXKo+tdHvw01G1q9IqhAt7EkaH0Z8eIt7/Ts
	 4cevoEGNpZwEV+jEVZ+pBWhwroHw3Vf/qj4f1Ci28Q2WAJjkE3oN2PMgERvLUsUJAuTCy
	 fHkmPNbIdJ+idwKQbBvdLMXjGCzWG+gXSZMc/zzP/Ssq5YqKjLpK4U8LfLuRxrym0FvjY
	 bP50rZQ3M0z/dd8B7Sg+jd1Yi8H5sQ/+8cMqAJRSAIqfu7Bir5aLW0kWbNiXDz8b2iizn
	 JKYDKM2MwJ5A9CxxYr8tZiAiANYN1txin8zt5u3uGoZ7yNRrecc7a6hdBT4bO6muZRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
	b=sZz0A3liZYPKSHvQo0s+22QYErPDXvGJQfXxTr1EGRTC08cIg2yAKMRXDipBlEuLddPV
	 Zs0ANpxrJ2F7pTeRIZxE1j6uWcgx0Gl8YbuBLAswCvbAHMaFon83eY+bKjTvXp5GMNheN
	 UXberp1jDzdC6jDUgq66TSLgydw71KomuiIqwfmGxxsl5yMUNotqgm8r83d4Z1z6fNjN+
	 PFsOxJYE+WK/JxD9jDL6iuIqCA3RQpPnCAvyNfMpxCzmbB6TJcWl9BYuint9dcuJbPauu
	 QfZq4I2xABzaaMwRPR0S9uMnmJ4h9mxycnVIM38Xryd4Py6ukylL1hlIwJx0jni93fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQ9MXEHj;
	arc=none smtp.remote-ip=74.125.224.139
Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90747606D203
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90747606D203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQ9MXEHj
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-67a51292ce3so1428281d50.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 08:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329704; x=1794934504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
        b=iQ9MXEHj99R6Za/CnMtjaRwnq8PN5Dw1EHSfCZVwssJsk4YnLOJoks79peXJeTzgPn
         R5r26EzF5+5eSXOIv3mjeK5Xya+e7y9SELgiLIrEoSbZG4m/F1DZ4TrehaJ+KtXRBtT4
         871s0OCP5Yee7408DlzCO/1xf1hLqak4jTbyEXjfh9PH6uhoTUdnfC38UaL4w0PsGaa1
         I6+b1iruk6ZRzuQsaxu5gp319ZDjneKSXTj5x6wfM7ULxuq1SD4QXhp1mBXkXd4Eg2dO
         IDZOICE7voNmZ/6vXCSJ0CU1mTZy7eAXHCYANfpLPIGdKdELQfEiATA/4g6+IX2TyHla
         ZIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329704; x=1794934504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
        b=mMQaBMJi/SyHaZ8KoZFSc9amhKEkAXabUAZMcPzHy7n1VZTRf7eJTYci5qFVl5JBJI
         PTqipZ6FDfLzdYJ+tNzDXvHptN+DJ8G/I+KhehyJ5aBJj8lX99YDlfmIJbEWZu1jk5Uh
         OZk5WyCrCyCzoATSO6dpMLanr5PjMwTeLCvBrQTjAtjRpEvpMiJRtfCjtw4woH5sNfmI
         3HGxDCfOPaAWTlzRlXDiX6CiZ88tSaD5cHmup2JwHj9KIVFCvkaldOgYTGjml+m2AI53
         7J/2/PEmf3D94Wepg9tUH0hK0OFzglA9hHwG/fjQa/UA9K9y106jLUQ/vzjjHzMdFJ8t
         NUTA==
X-Forwarded-Encrypted: i=1; AL+hErHb2GhcKIt780lHDwMRiL05p57krNf143g8p/1Wzr/ocLLNCBC+PTBm3ewMewWHc7dc7ikYmybBmfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B3IvC+tVYZOBNNNq0Ha/D4le5rFw4FVCDXjtDDilDB1I/QDui
	HHlJmnVREBTc2uSXjYtExEGEF90TD/ZpEcAP2DwEbffdqqXmR5N6nJB9
X-Gm-Gg: AYBFou2cHy1qDiozBa/1S9tHOEAAgEPM8P1kM2DvhmkjHMaPnFd33fsb3F3JkCBKqx1
	8Pb4H/p0PpA02065hzdm14Min5Omq2cpYcERNfqMWV2q1cb1f0YY9TVYWgb8MDxMA6vVeDOlCJ9
	F7NWBkrLd1gTSmDeYwiRXbN31RS4an+uTXfLUVa4x6CS71t5FFKcuJDDLwF+Q+XA+R+LEJGf6Tp
	BkiLH0Tg84eIt7xMX5zyYX4NXK6sA85Eo5ReMaONwNCceXoBHQsZ9RtwcPLejc7m4UbY45XUw3J
	DfWSmnb0okJld43pf6ScP+rMb0SgETdi3U+6dY4V48oNYunsUOviju4FOU3MRU9pySR+w+lMHeh
	0Z95a0OizwBgXW82HJ+jSoHlsrepZU7aEv2v+JT+7OvUCDcXZlCJ5gxnDQ8L3fOEo+ssQOpEGjk
	EqL4jufxbB1lNnM3e+v76bdJHCxprq2RwBVnGos46RkAm0m0CYSsnU12jbICVIhPnSH2HTi/V83
	+k1OLJ1wfm1SqEjvVfjYCsDRxqU5mWSWDQ/4bvf2HT/yHOE70JdVKald9cb2iX81p+ayhE2I60Q
	VbrwYegso5axXdAAPaabWcDR9eWC05SzG+o=
X-Received: by 2002:a53:ed04:0:b0:679:b810:6df3 with SMTP id 956f58d0204a3-67c568c72d0mr1465408d50.84.1794329704143;
        Tue, 10 Nov 2026 08:55:04 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm2255948d50.6.2026.11.10.08.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:55:03 -0800 (PST)
Message-ID: <a24bc088-3316-40f6-a9c2-acb77fc9befd@gmail.com>
Date: Tue, 10 Nov 2026 11:55:03 -0500
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 5/6] tls: send a KeyUpdate at the record limit
 and on request
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-5-99b695f9eb4f@gmail.com>
 <179424471332.994134.12793914111732564453@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471332.994134.12793914111732564453@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> Is 2^24 the right limit for AES-128-CCM?

No. RFC 9147 section 4.5.3 and Appendix B.1 give 2^23 records for
AES-128-CCM, for the same 2^-60 target as TLS 1.3. v7 will use a limit
below 2^23 for CCM.

> Should TLS_TX and TLS_TX_TRAFFIC_SECRET take tx_lock, as
> TLS_TX_KEY_UPDATE and TLS_TX_MAX_PAYLOAD_LEN do?

This is the lock drop listed under "Not changed" since v4. A TLS_TX
setsockopt() during a sendmsg() in another thread is an application
error. Mainline has the same window: the existing rekey takes only the
socket lock, and the records of that sendmsg() can go out under two
keys. Taking tx_lock in TLS_TX would make the setsockopt() wait behind
a blocked sendmsg(), which changes mainline behavior. The design of
this path is under discussion in the thread on 0/6, so I keep it
unchanged until that is settled.

> Can setsockopt(SOL_TLS, TLS_TX_KEY_UPDATE) block indefinitely on a
> non-blocking socket?

Yes. v7 will remove TLS_TX_KEY_UPDATE (see my reply on 0/6). The
kernel will then send a KeyUpdate only from sendmsg(), with the
caller's flags.

> This isn't a bug, but two parts of this text don't seem to match the code.

In v7, the text will say "before the next Application Data record".
The TLS_TX_KEY_UPDATE text will go away with the option.
