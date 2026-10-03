Received: from mail-lr2-f20.google.com (mail-lr2-f20.google.com [74.125.230.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB69841378E
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023050; cv=pass; b=QY1ZaptdyYuoA7Se9WCrriyI/4Nfkt9Nof73Ak4fSezDCGiA0Go1QNL3/iKdXz9uXDdRkLzPXIxcTnGKdZyBlRy/l+b6k+u4/iY9guzh6ppdKkm9NFgABCrxYgmmDF5hXpZg4qoAH0eSUsNAiA2W2t795V6Gpl87vz2mQgx+nDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023050; c=relaxed/simple;
	bh=sgu4JSbp6cYgNijyoqtv3f0TarB6ixKdQIPpCsjQk7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9t9MhkyLiKbgNi00c3Z8AgYdNICFA2jyxPvVP5nuNT+zBoDVjmk0GD5fUPCUUQ7ACpM3ngnwNrMsYlh6NIrK3GhGjFmU/UrRxhK+xGt5YIWnFbZREDfAx5FFq/gmzp9unaU+9ohiem0A80w63AXwDxH0U8fPO2mdSJDWzYALWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRaME8Z+; arc=pass smtp.client-ip=74.125.230.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRaME8Z+"
Received: by mail-lr2-f20.google.com with SMTP id 38308e7fff4ca-3a1f75375d8so868871fa.1
        for <linux-doc@vger.kernel.org>; Sat, 03 Oct 2026 03:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791023047; cv=none;
        d=google.com; s=arc-20260327;
        b=BHttutEuwfZvwjaYfkzc4SBaMXz8YTKI8kc/92mm6D4rTvXFWkD3wsVNlFxe/iYapz
         vGiPV0C5nAuzSW+DwVl2sdV8nK+mUVXLNA0SaMpcL8AhJKeYozh4q32t7wAYRho8FAIg
         JlwWYKxRcPEhZMaOQBy/JDzwk3dGSTgblv0P740xiKTMkL1liYUihIepl0Y0aRvmuHjZ
         axyDLqQ7MPuxHIZ5BQzd1EJEbMCh2ustQjQldh7B72QlneRbqBlUcPr0oXrJ5RwPVadB
         z7jxhypgNwLMlhKggGsTTCuu81h9e2hADBHQC3A5+VZyHlbHNsXqALAnDOcxdbu7FBlt
         Q7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgu4JSbp6cYgNijyoqtv3f0TarB6ixKdQIPpCsjQk7Q=;
        fh=USSO/tWZhzVMQIWrQxWW+GzOfOlUisUhHSR2OZTJHwM=;
        b=WXMaSVuIvaydIXviZcdpgc/18lc0UiAMaFFahjXofAtcjcFhfujbWQCRA1cE9SUYnj
         2sM3oJazHdp2k7GUhwJNMWeBex45zGE6jICtOZWjOm4I5UErA04Pmnz+oNkq0eyN3/ba
         qaxvW5hBkHUv9kN/OWo3RRWYFHBL7YTmJQyR9ndUFoLuBpQXGFwH3ADqZU+cvp8LtwYV
         9IT4RcX4iyvxe6BWqRD6lBvbCWoktT+ydVXKqyCHa+JeX+gYgfAQFqclfHyOjN5dd4v5
         8Q7dvnsLiPAXx1Lxbmkc3wpMvfVWevuDSGStk3F83eFk/dPKV9DKhr2rAu+6w5y5HmGK
         mIbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023047; x=1791627847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sgu4JSbp6cYgNijyoqtv3f0TarB6ixKdQIPpCsjQk7Q=;
        b=fRaME8Z+QwZa7zX+rub7EWmDQ9NyBR94KxTWwD224tHGqYpPE5tISxPHXqwE2YZOLu
         5XASDPZulwRlXT+oAydX0ju2vdCYFzdhV85lDbgvBPDUQUqsX3U/3dOGKbCfAjnKoBvC
         dbGsw/NlnqZ9l8DkmNReqx4pg9WEMJ11Lxcyg6H33wgTnom2E5PveNytAkahv7QSZCjb
         qjN5fxTMrvfz9J7CP/91e4T9c89Ak8HUNNixtzDWtJuqwYze2Myu6Po74Zj8iUcffE1R
         qHBPyOEafLGq4enBPGalgdUf1azmHvAEH9MshriJ1eHDE6LpUx0aSx/aJ/li7yKueItC
         kHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023047; x=1791627847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgu4JSbp6cYgNijyoqtv3f0TarB6ixKdQIPpCsjQk7Q=;
        b=Fhp+wThFiN8coLR1A7n7eYqf9/KNbQ9NANR5basAzSNi7O2lsCcpjXVxHbFDRZG6cO
         +/knOo4buQguWv8j39ZLZlqOTZv3IW3eGjfUdRLoOAxSWnFQLcO89m3gDVnWJAx7z/lz
         Q6G4ZxkMH0wqCfQlUyWtw1Q/+Y68XDpXl+GZaQuNhYVdmJLNP3i+/wje6XETzzBPZ/TI
         v8xISiUEhiBSVaXKjoun3N0ll6vUooNryjGc/6v1d07MAVPNghRXzOTpeRSnevbl4ws6
         N1zBpDU8DhTQ2auQG9BsjoHUZ99V94g7Kd3zsd/uCnemP2msXeuIo0RO33wPuQ2jqQZC
         BQ0A==
X-Forwarded-Encrypted: i=1; AKwUvBzrRDoMReVSdpb46OErtx/ydkv9qady15NZ8HJ3tHStD8CqE3wu5oXAWofbvycO//hI7SZGFb1kpIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZKcfjGVnPWsCHdOOk9G7k1BMhsfIiyF9X1hqWz1eEvtTF9gom
	cV061fIhAgtw17+NlReK6w/2AGl/xrK8vK7mdSdHRcV+3ORnLS8PNL4BzOJOyppOzTI0Q6IUz9N
	BwZYB9L+bfQLxTHPb0zGGsBZbQDO9UVw=
X-Gm-Gg: AYBFou0+zeVDMpnyhkM05lhQOcxfU6IQDM1ywJ1l4W8EYS2dYdqS40YdSH1QgfIFRnw
	cDOoVKAZnJVbc9aBffIvLpLAX5f6z2D9s4X+ksVU5rAC/ISwTmUcdiA1o1opKeX69EJPcXDS/An
	MKgpENuGmgd49HyRlk6bwCG7+fclk4G4zJKSzsuRDFeMvVdu5hMHNBRBNprcmx6K2XbKwQnPUIH
	cY/XCR+8lZYg8MdOzjIhR9vMqXxdmAXLpiVVATYDkleLVoncPZt1QUuZKRcEY9awPZsv6X1J2v2
	nktPjRK9M91sLVLy7NhvTRJlcsZM5MSB+yspIMZDLvsvLEm21O3oGTGNhSYozce9uQiHC4Ii7DN
	IX/ZSFP4GLF7HrqhQFk0gqyD9Ewem+I1lG3BQ
X-Received: by 2002:a05:651c:1612:b0:3a7:6b01:849e with SMTP id
 38308e7fff4ca-3a87ec283c0mr14770191fa.0.1791023046561; Sat, 03 Oct 2026
 03:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929131142.266819-1-chenyou910331@gmail.com>
 <20260929131142.266819-2-chenyou910331@gmail.com> <asCIcsjSHdqF3oI-@wyuan.org>
In-Reply-To: <asCIcsjSHdqF3oI-@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 3 Oct 2026 18:23:55 +0800
X-Gm-Features: AclHuK_NTbWNX2dM7QqOvgSjfu1HuPqVHS6q_wtYl901z9CYUgOhTaKfFyCxsLA
Message-ID: <CAKspUhLQJ7BiOEULudkq5AM5-FB-DEqfyQTsbq5YBHvG2YS-Ag@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/zh_TW: add a notice for translations not kept in sync
To: Weijie Yuan <wy@wyuan.org>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, si.yanteng@linux.dev, 
	srcres258@furdevs.cn, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gU2F0LCBPY3QgMDMsIDIwMjYgYXQgMTI6NDU6MzhQTSArMDgwMCwgV2VpamllIFl1YW4gd3Jv
dGU6DQo+ID4gKyDlh7rlhaXvvIzoq4vku6Xoi7Hmlofljp/mlofvvIjopovkuIvmlrnnmoRPcmln
aW5hbOashOS9je+8ieeCuua6luOAguWmguaenOaCqOmhmOaEj+WNlOWKqeabtOaWsOacrA0KPg0K
PiBTbyBoZXJlIG1lYW5zIHdlIHN0aWxsIG5lZWQgdGhlIE9yaWdpbmFsIGZpZWxkLj8gOykNCg0K
R29vZCBjYXRjaCAtLSB0aGUgbm90aWNlIGRvZXMgbGVhbiBvbiBpdC4gQXMgbG9uZyBhcyB0aGUg
ZmllbGRzIGFyZSB0aGUNCnByYWN0aWNlLCB0aGUgc2VudGVuY2UgaXMgYWNjdXJhdGUsIHNvIEkg
d291bGQgbGVhdmUgaXQgYXMgaXMgaGVyZS4gSWYNCndlIGV2ZXIgZGVjaWRlIHRvIGRyb3AgdGhl
IGZpZWxkcywgcmV3b3JkaW5nIHRoaXMgbGluZSBiZWxvbmdzIGluIHRoYXQNCnNhbWUgY2hhbmdl
Lg0KDQpUaGFua3MsDQpDaGVuLVl1DQo=
