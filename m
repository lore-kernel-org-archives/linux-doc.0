Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769947;
	b=KxXyY44LumgKGiY4Epz9uRD/CAcud9PsUCBYsaEnq1lEpU4p5nMEESDFKTcCrUujCNcl
	 EwekB+Emd6THCA8FCuic0qXEBwV0decrY+0N2CFpIxmyrK1cuv4QoAMt7JI/786vKh+Yh
	 UkLIoGmxAwzLcuogQO0+lCHhHoV7F7r2c03UFKmi9C5zNP3G22+yGlqrQWQIplcZoGjr0
	 XL/qblih3JSi4YGMBjGGO+WjPjWEioKKYNaBSSmwSZUJi7xCi3Qqdt4m8SH4Z7WD8bPKA
	 +09bfFCZnhL/yO/3xVCHD30XHq4UixF0NDtq3oP0VWhaj15m+z8lBOx7LGnaJrc3djQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769947;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=5XPxjYP84J5qtW2J4U30RzKiijCCUuN8hhLODUHRDy8=;
	b=IIK0Rm8yIw+JKvP14ffTrHNntyk6WmygXsAkS7c9WNdGVCwQ75jSD3OjGp+epQeL+UbS
	 tMjEdNi9mn3g3csod9BebnGQFl0um8eN3qMm9bfY8YXWwnBoQZXz9NLpRXYGzN75UbKTO
	 TorUJcfHw8vOgR1oTBD83A21bleJsIn7wf1Xvt/XsUPZ+5nHDeEEaYhSJTJwPLo08/p4d
	 B0hfno3tXyz6fYA5BRxM7IOb5kk+JVtZ4UKSU1/2n3vRydJaWzgyjd6M1ZxAbG6ZzPpQU
	 PxgeuQMVjrZMPmu9kxvb/uTiFAbVbmqz47JNV7+YB7Dyafsb1uCYzKBH/WxLpmZNWew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=ObQQUMe1;
	arc=none smtp.remote-ip=95.215.58.136
Received: from mta1.migadu.com (out-136.mta1.migadu.com [95.215.58.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8286F606A31A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 15:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8286F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=ObQQUMe1
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Y1dlIOjwh5FFz3HNYQ0e2sREZLIjYAXBLkpbKMlVqBA=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792769943; v=1; x=1793374743;
 b=ObQQUMe1YcuLd1jO8u+3kj9hrSyK3XKg8wf67pRzbbDmJI601UkPvlg5bL5ZGtUItaHdVgpJ
 qOuNnc/mG7UZuCQl5jhodnz44lLN8KqJxJI8ZORAXMQHM13xNG3EwHAqTj0mu/ZZRfupI6nlrpQ
 2jCNyJCoNHatnviz/HpK/ZgcWrliL8Mtfg5qqD8uM8ym59TioyL+neEyLe5v4UTjIi8AX54SiP8
 K/FLbwwxsFluFwIQuPCbxxYLt4otTUUhJRTvzk5pkjpsP8OdZUn437SkwgneolTK4noc5t25u07
 V9bTQiTEq5ZrccXcsxdXrfr4NTPl/OWCSknQW2qnzTOgA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ea7d77c4ee75b1ca;
	Fri, 23 Oct 2026 15:39:03 +0000
X-Mizu-Trace-ID: ea7d77c4ee75b1ca
X-Migadu-Flow: FLOW_OUT
Date: Fri, 23 Oct 2026 23:38:59 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Fan Wu <wufan@kernel.org>
Cc: Yan Zhu <zhuyan2015@qq.com>, alexs@kernel.org, si.yanteng@linux.dev,
	corbet@lwn.net, mic@digikod.net, dzm91@hust.edu.cn,
	skhan@linuxfoundation.org, gnoack@google.com,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH 09/10] docs/zh_CN: add LSM/ipe Chinese translation
Message-ID: <att_kzD41pBMHw3O@wyuan.org>
References: <cover.1781105672.git.zhuyan2015@qq.com>
 <tencent_DADDE291CA580302EB7BB40B83A552D6F006@qq.com>
 <CAKtyLkE3unhxMsH1LpqvjHQoKVgz1tcTsZWUxNHs+R6v2amf6w@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKtyLkE3unhxMsH1LpqvjHQoKVgz1tcTsZWUxNHs+R6v2amf6w@mail.gmail.com>

Fan Wu <wufan@kernel.org> writes:

> On Fri, Jun 12, 2026 at 8:59 AM Yan Zhu <zhuyan2015@qq.com> wrote:
> >
> > Translate Documentation/admin-guide/LSM/ipe.rst into Chinese.
> >
> > Update the translation through commit d7ba853c0e47
> > ("ipe: Update documentation for script enforcement")
> >
> > Assisted-by: Claude:deepseek-4-pro
> > Signed-off-by: Yan Zhu <zhuyan2015@qq.com>
> > ---
> 
> Have you tried to refine the AI translation? IMO some are really bad translated.
> 
> Also how does the doc translation project work? I do notice there is
> another IPE design doc translation,
> https://docs.kernel.org/next/translations/zh_CN/security/ipe.html
> which has a wrong "original link".

Noted. The recent consensus we reached is that this field 'Original' may
be removed soon.  If not, I will send a patch to fix it.

Thanks.


