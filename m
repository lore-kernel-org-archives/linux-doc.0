Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C1242CB0F
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697560; cv=pass; b=lKCLxlCkgt3DM48iwn4+7eX07y/0erya3Z3WskLsFmjyK9Z6V/CAqO9Fgjht3qfFLrPXK/WKzGWDVi27gm0DzaiuRMfdB7CdicG+niRVhB2C40JAwpTuPmhtUQDbPMmCEwK0CROA/euqyQphLhdJDj0LB29uHA+bx1PGU8F4x+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697560; c=relaxed/simple;
	bh=LD/HoXawwSiJkE0tqPWy8TxRHVZpMFV44E98okcn0uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRSG/1K5drnfaHjfPvuKDv8XFDnt+GDJE3w1BIx90K4ah6nPQ6HpAcvKzJE75yyFYAJqJ/rQx1bN3AYz70QWNXZL8Nu8/cqnFjurfqrmddH9fYuohhNrYd+YVKbRgxhxg0a4i7ZTI159B4S6NTqo2cMV5/XijuzP99OJeTYlpn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBjhuiao; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBjhuiao"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc891373e0so9995185ad.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 08:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783697558; cv=none;
        d=google.com; s=arc-20260327;
        b=AozE+8MPZblIptqZs5LEWlTBw5HUIaS6HHjRBD4mEfHYLO1oqaZ9QuN19lQdkOLZmH
         6pwppu2W4iM8zoaNy8aXTPNU+tmXTjRQRa2FSMME+D0yogp7PNYEKbw7V0M6lr5R1PUe
         g0z043D51W6jk/Gy/TRZ7U55VSvYIrXWc4ABV4MGHkNmwAzIRLF/fwSy3dWPUlExZl5K
         QDQs0gMJ/BtuERhIR87z1fjRqH9cr0ofqhLDK1iMVq38dmte/t+Y+txzt1dKSD5Nw74z
         7rBrf3uICA9uzYl8TpcqBWeOjTkwLG6NdeN+ZwqcIN1VcTYNfyp5+Z1ceShYxRUf2+eE
         EPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LD/HoXawwSiJkE0tqPWy8TxRHVZpMFV44E98okcn0uQ=;
        fh=FgWxEsQu+U3+wChPAnwfpOSoInd192rzl8PDYssPwgE=;
        b=e/Sa1CSzV46elfW85Wo4ExFE2mYeBtCaXDoh6lXChVB8Pi8XAFcfJ7N7zyZUXXhrVB
         LfvnJO8UDaHZpWEoCJVYL8WpkvVVV0d/GqyyTuBJz9gxuBc+v1iea+FX9crcfDTCwrG3
         XGko2RK/QSrVv+rcbYeKrW5SknUPFHGXmWx9Nabox2EunsaVHirG0TYZz9rw4nxTbXVR
         cRLcwAJh5gLjoWEdcOUZWM4YvmqhVHNpo/DmV3VdQHG8ys5kCZrtrkdjlf9JVOFAmcdC
         O8csgEeEEZZQuRIgjUz/jfD7eto1eRntrN94RiPgFelpXggS8y3nPCph7cXfhhUBhMjv
         r56w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783697558; x=1784302358; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LD/HoXawwSiJkE0tqPWy8TxRHVZpMFV44E98okcn0uQ=;
        b=gBjhuiao85kliPAtWQRZSCYeQP/QIcQCfg74Ce5nA+jM8MI+iAw4QWWHj6PCwBoF01
         +lJu4uWa/pdnqC93qyB/5GEbYX16Mi2QsIQ90xt6WyWyCqT4Un5yK8lQZXXplXOnnsV0
         X1QmrJ1RWHY5UwzASYmfFBSU2XN6gZ0TXRT0aM7VWBW3/ivwRBpXU+i4OiRyLXCFVk9B
         qwk7Lmez1FEdADtTNGJSZWb7HPuPHYqes8tmRHXvUAtkm9mHzQeLXZMbNm6bJRJN6BoX
         OBdUFoonxtbs8VPMDjoKZav2Oajmhaw7i1xqBS0Np6+EfFE0kja/PMkjY13F0mePoFKV
         D/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783697558; x=1784302358;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LD/HoXawwSiJkE0tqPWy8TxRHVZpMFV44E98okcn0uQ=;
        b=qkprPVo5E2ohxesYObb0TbbQ7mzqE/6JI0ZP+zLMVVGXrkwl/FdkDTZNwahk2ggX+D
         wHEUA0QaLujzxmQ+onhJ0ux7JNgSWIVTEk4PVRgJ7LzW/Yz93ZktGrrkuCPiCcUFxe7S
         DDymgjVGSDmMDnIZDXr+asCF7XIG+QtQUPB8qfxXbLW57j8N3pdeE77BS034SWEan80j
         diI3BeKwr0kDO5Y+4OwgAMJO63xkavrzoayh/FpcfYEWjYOwYj2adzrNBAEM7HRzjgaA
         5li4t1L3xJ7hYB8BKX+fGeVASz5wx1mXGKOPC7q00d+2n2n/fCweq0gkpUTbmPtKhkf9
         m3IQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXqdGRvrFQ0YzF4NF2rwpv+gHOQ29hTycdv/BUMjCCDdiTr2OxqSDEh3UuP9gNtKB1+07iD8kn9VM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT1PLnFOFy1t/XySDflzU2MRhHQWMdXiQfV4aujmAyubWOb0N3
	2i1D/wAM9vRPJEElKK5Oc0JA4pl5Yr9Ygn4WJ3IfIAuBArKTr03jYN9Mjw0JZ5nZjP5p1y973C8
	wa5g2K16QIeI8ZTclunZRWkUaUrdhKUg=
X-Gm-Gg: AfdE7ck2H4US+Hpk3dW/q9MrTVevzevgQZkx3muUpa+U59DNZ7cCeY0YCMxz+oubj0T
	e2IJ9tuUVx5KsgHYVWWkBeC94E86i3HhRSwypq9jpOxI9me5SlD+86xHjFDvVPpNSKrzAXYXK9v
	LfpwpJr1XbPx6L1V92rweWiIb+Zp8M1uisZ2naIGHDULwBnXz8BOxRJp/HeKBNSaLPph4flb6Dp
	veM3xTlnzq/KlwGEmmROEB7L6bMiYps50BNVcUjwK1+uLDrsAYBwJvZk0jr3CQu0JB58cJqIboe
	WjMOkd21yITAxvqhdtIMPz6gEKkqkddNn6jpFLr96KG7XSmD35NrYbs+nYAE
X-Received: by 2002:a17:90b:2ccd:b0:37f:9ce0:af31 with SMTP id
 98e67ed59e1d1-38941ad2a55mr12198944a91.28.1783697558119; Fri, 10 Jul 2026
 08:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707014525.1015-1-kimjinseob88@gmail.com> <20260707014525.1015-6-kimjinseob88@gmail.com>
 <20260708022006.4276fc99@jic23-huawei>
In-Reply-To: <20260708022006.4276fc99@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sat, 11 Jul 2026 00:32:25 +0900
X-Gm-Features: AUfX_myFYIBykcPPdf8s5JAjoOTFSzN_9Jogzi0T4pIoiCbRwRR3MlGuA2VyJNw
Message-ID: <CALMSewLT_FM33VqeDtcReZt03nmRrs1R_a_6dTVPXMiFfbWJ4A@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] iio: osf: add UART IIO driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno Sa <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is only defined in this patch but is used in patch 4. Make sure your
> code builds after each patch so as to avoid breaking code bisection.

I changed patch 4 in my local next revision so that the stream parser no
longer depends on osf_core.h or osf_core_receive_frame().

The stream parser now accepts a typed frame handler and an opaque context.
Patch 5 provides the wrapper that calls osf_core_receive_frame().

I compiled the sources introduced by patches 3 and 4 separately using
temporary uncommitted Kbuild harnesses, and built and linked the
complete module after patch 5.

> This feels like going too far to deduplicate just this. Put a copy inline
> in each of the other macros where it is used and drop this one.

I removed OSF_SCAN_TYPE_S32 and placed the scan_type initializer
directly in both channel macros.

> Looking at this again, why do we care about holding the device
> in buffered mode for this? Races should be safe without that
> big hammer. A simple check on iio_buffer_enabled() should ensure
> data is only pushed when it is enabled, or just after it is disabled
> (which should always be safe).

I replaced the buffer-mode claim and release with an iio_buffer_enabled() check.

The one-axis and three-axis cases now return directly from
iio_push_to_buffers_with_ts(), and the default case directly returns
-EPROTO. The zero-initialized scan structures and aligned timestamps
are unchanged.

Thanks,

Jinseob
