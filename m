Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F8C23D7F4
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 18:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377964; cv=none; b=NRrhiT6NB5dtdg60uKoXmSX9LvoWBf0D/bChW4thwe7P3b3y46QMefJE4CoVjoSLXJtaO1rnVEY8fxfNOr/H1M56XjRhQOOqrj7i5NWf1IHleJC07nfvlhM5t5zuz0XQerDavnRh1BmVLNksHrVDIfiQbG3M6id89+V2FySeMO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377964; c=relaxed/simple;
	bh=y+wo9iDBeS0npMhD30rCCyek5oK7q7whGhlUCHN1HNg=;
	h=Message-ID:Date:From:Content-Type:MIME-Version:Subject:To:Cc:
	 In-Reply-To:References; b=bzFmNTxeADRKCZutYRwsArilXzSHB5JMf66ZPWecIMmOUSRbIVgUFzfNtfvM8NtjMBIkbyyH5Q1UxyZwciDXCbkdaGThs8MPlIL+jE9jZVVNGYfbJtTEFPuq9QYN1hRiUz3BknUiFsU6AzX/cu1UG6viTZsQdM2BZe3fJhmOgwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgtb2z3c; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgtb2z3c"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2adff872068so19837375ad.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 11:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774377962; x=1774982762; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:subject:content-transfer-encoding
         :mime-version:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+wo9iDBeS0npMhD30rCCyek5oK7q7whGhlUCHN1HNg=;
        b=hgtb2z3ck8Yx/38H1rKpkroQaw4J5kt8YKAEPdPZygaxPwld+KNoseNNno20d4YXI+
         KAIJJfgonX7OavkZJaBi9WYX82TIw5ejEqY3M61w3zRe4mUANlROnLfNVe5nznANB/uY
         WbY5i1dYTeSM35iSwq9iRGQTrqCT8JzChsQF0ajRQgdB2PQ7SJKDTiIATl/pHNv1QB3A
         OulkT1mFO3AtVmBUVVfC3RaV+FRHn/yPd8bmiFP59LdNnlZfQiXJG1zm4UOl+xla7JWY
         Q2aa/v2b/XURZlG42p6xmGv5KqV9x2nG6Pd8e25cq8sAwY+9uG+LNXO0J3eSJMMhwxVm
         KMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774377962; x=1774982762;
        h=references:in-reply-to:cc:to:subject:content-transfer-encoding
         :mime-version:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y+wo9iDBeS0npMhD30rCCyek5oK7q7whGhlUCHN1HNg=;
        b=cU93S+ElBVnRdx9Cd2gSBBFtiK4KZwl14ZqIQO9n0SOgUG6kyaYNfXI7fMgwzIi4Y4
         rkljwhMkqOjnd0vJVSKW569xnQTBWlanDGzYHXdICp15/XPUfP750cENuw7LAo8LrE9r
         ei9bT1WQUkt3OfRTf5hkr0ZA1hk5/SDB3d55riM85mJ1za1inxAvSsBkHjEJazsi8/4n
         mlERqPxCjf4ArBdJwrk3u7ypLjy5iKEpjURsINZco6zvMuz1+sCrdoAeNohC2yBI39lS
         +06q9+E7uaAA39yORx/L6/4YMmo3BYhw7p82apYG0yipVuV3bdOt2v55kJSJrK7Yv+le
         A9Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUwnQkP0Pu/JnNl6zNhSmGc1/ObnGoJAhwOZ2Hk3SVQreDHo0fLp5YSiJSkxdDckFssox5InwMsgzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNc+l/Hrnu4J2SriKBQH2AHxPfiniWAUycpNT67EePu8vng0qW
	klZc/+0tnTjM6R0hPFPyUjwD6j/XjkAJUyPlEhdS/8kA2paARMQYMvSu
X-Gm-Gg: ATEYQzzDS4HvinzqBb6rWdNxqyzNIiXggbRaa9BA4NWpBw85FircFkGet8YsLYtWOfZ
	qmnC02tHEAQDGOKlj7lMNR+VS0G+Tn+17CFKQrhgH3NxEn1L6IZAFXrNRwkh4274BcK9NywxBpc
	9JG1Wi/8JaH5jSnRu+gFd9kOl6gKylV0jBRfdRX5p9tMPyV9BmRySRVsFbanEKbzybnzZ0VUOyk
	iIXrD+hGz5qvqqvreukEYHwlbxswvrm5V4Fb2AMIjUUaF1j8utYC9zw+bkV2vmrESEu5kdaAS0z
	F1r7v52co38m1WNFDH2QIa7Y7ljTZF0X8qexq9XMz9krH+j5ZNd5Useu0ok5HyEWwNIrMfqctNm
	s6ffzX3yihe03Jo0FopTyw7kM+4CTXAYFXX/W2FeEVQPmZrGxMRewZcOOdADZFtupULSRCMkDdj
	cg4RzWzYGjappg/NI+t3FzXHN2
X-Received: by 2002:a17:903:1b4e:b0:2b0:6895:5535 with SMTP id d9443c01a7336-2b0b0a8c433mr6729765ad.33.1774377961993;
        Tue, 24 Mar 2026 11:46:01 -0700 (PDT)
Received: from [127.0.1.1] ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083656f65sm221497615ad.45.2026.03.24.11.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:46:00 -0700 (PDT)
Message-ID: <69c2dbe8.170a0220.226f48.721e@mx.google.com>
Date: Tue, 24 Mar 2026 11:46:00 -0700 (PDT)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: Re: [PATCH] docs: Document pahole v1.26 requirement for
 KF_IMPLICIT_ARGS kfuncs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev, bpf@vger.kernel.org
In-Reply-To: 
 <CAADnVQLbtuD=7mtGZFR25ULhjZ-3ifBpkyRcqu9jPSd2Mt3fBw@mail.gmail.com>
References: <20260324062028.2479059-1-suzhidao@xiaomi.com>
 <CAADnVQLbtuD=7mtGZFR25ULhjZ-3ifBpkyRcqu9jPSd2Mt3fBw@mail.gmail.com>

T24gVHVlLCAyNCBNYXIgMjAyNiAwODoxMjoxMiAtMDcwMCwgQWxleGVpIFN0YXJvdm9pdG92IHdy
b3RlOgo+IEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHRydWUuCj4gQXQgbGVhc3Qgd2hlbiBpbXBsaWNp
dCBhcmdzIHdlcmUgZGVzaWduZWQgdGhlIGdvYWwgd2FzIHRvIGF2b2lkCj4gcGFob2xlIGRlcGVu
ZGVuY2llcy4KPiBQbGVhc2Ugc2hhcmUgZXhhY3Qgc3RlcHMgdG8gcmVwcm9kdWNlLgoKSGVyZSBh
cmUgdGhlIGV4YWN0IHJlcHJvZHVjdGlvbiBzdGVwcyBhbmQgY29kZSBwYXRoIGFuYWx5c2lzLgoK
UmVwcm9kdWN0aW9uIChVYnVudHUgMjQuMDQsIHBhaG9sZSB2MS4yNSk6CgogICQgZ2l0IGNsb25l
IGh0dHBzOi8vZ2l0aHViLmNvbS9zY2hlZC1leHQvc2NoZWRfZXh0LmdpdAogICQgY2Qgc2NoZWRf
ZXh0ICYmIG1ha2UgLWokKG5wcm9jKSBMT0NBTFZFUlNJT049LXRlc3QKICAkIG1ha2UgLUMgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvc2NoZWRfZXh0CiAgJCB2bmcgLS1ydW4gYXJjaC94ODYvYm9v
dC9iekltYWdlIC0tY3B1cyA0IC0tbWVtb3J5IDRHIC0tIFwKICAgICAgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvc2NoZWRfZXh0L2J1aWxkL3J1bm5lciAyPiYxIHwgZ3JlcCAiZnVuY19wcm90byIK
ClJlc3VsdDogMjMvMzAgdGVzdHMgZmFpbCB3aXRoOgogIGxpYmJwZjogZXh0ZXJuIChmdW5jIGtz
eW0pICdzY3hfYnBmX2NyZWF0ZV9kc3EnOiBmdW5jX3Byb3RvIFszODJdCiAgICAgICAgICBpbmNv
bXBhdGlibGUgd2l0aCB2bWxpbnV4IFs1MzgxM10KClJvb3QgY2F1c2U6CgpUaGUgS0ZfSU1QTElD
SVRfQVJHUyBtZWNoYW5pc20gcmVxdWlyZXMgcGFob2xlIHYxLjI2IGZvciB0aGUgREVDTF9UQUcK
Z2VuZXJhdGlvbiBzdGVwIHRoYXQgZW5hYmxlcyByZXNvbHZlX2J0ZmlkcyB0byBkbyBpdHMgYnRm
MmJ0ZiB3b3JrOgoKMS4gc2NyaXB0cy9NYWtlZmlsZS5idGYgZ2F0ZXMgZGVjbF90YWdfa2Z1bmNz
IG9uIHBhaG9sZSA+PSAxLjI2OgoKICAgICBwYWhvbGUtZmxhZ3MtJChjYWxsIHRlc3QtZ2UsICQo
cGFob2xlLXZlciksIDEyNikgPSAuLi4gZGVjbF90YWdfa2Z1bmNzCgoyLiBXaXRob3V0IGRlY2xf
dGFnX2tmdW5jcywgcGFob2xlIGRvZXMgbm90IGVtaXQgREVDTF9UQUcgQlRGIGVudHJpZXMKICAg
Zm9yIF9fYnBmX2tmdW5jLWFubm90YXRlZCBmdW5jdGlvbnMuCgozLiByZXNvbHZlX2J0Zmlkcy9t
YWluLmM6OmNvbGxlY3Rfa2Z1bmNzKCkgKGxpbmUgMTAwMikgZWFybHktcmV0dXJucwogICB3aGVu
IG5yX2RlY2xfdGFncyA9PSAwOgoKICAgICBpZiAoIWxpbmstPm5yX2RlY2xfdGFncykKICAgICAg
ICAgcmV0dXJuIDA7Cgo0LiBXaXRoIG5vIGJwZl9rZnVuYyBERUNMX1RBR3MsIGJ0ZjJidGYoKSBu
ZXZlciBjYWxscwogICBwcm9jZXNzX2tmdW5jX3dpdGhfaW1wbGljaXRfYXJncygpIHRvIGNyZWF0
ZSBfaW1wbCB2YXJpYW50cyBhbmQKICAgc3RyaXAgJ2F1eCcgZnJvbSB0aGUgb3JpZ2luYWwgcHJv
dG8uCgo1LiBSZXN1bHQ6IHZtbGludXggcmV0YWlucyB0aGUgMy1wYXJhbSBwcm90byAod2l0aCAn
YXV4JykgZm9yIGFsbAogICBLRl9JTVBMSUNJVF9BUkdTIGtmdW5jcy4KCkJURiBldmlkZW5jZSBm
cm9tIG91ciBwYWhvbGUgdjEuMjUtY29tcGlsZWQgdm1saW51eDoKCiAgJCBicGZ0b29sIGJ0ZiBk
dW1wIGZpbGUgdm1saW51eCB8IGdyZXAgLUE1ICdbNTM4MTNdJwogIFs1MzgxM10gRlVOQ19QUk9U
TyAnKGFub24pJyByZXRfdHlwZV9pZD0uLi4gdmxlbj0zCiAgICAgICdkc3FfaWQnIHR5cGVfaWQ9
Li4uCiAgICAgICdub2RlJyAgIHR5cGVfaWQ9Li4uCiAgICAgICdhdXgnICAgIHR5cGVfaWQ9Li4u
ICAgIDwtLSBpbXBsaWNpdCBhcmcgc3RpbGwgcHJlc2VudCwgMy1wYXJhbQogIChubyBzY3hfYnBm
X2NyZWF0ZV9kc3FfaW1wbCBleGlzdHMpCgpXaXRoIHBhaG9sZSB2MS4yNiwgcmVzb2x2ZV9idGZp
ZHMgY3JlYXRlcyBzY3hfYnBmX2NyZWF0ZV9kc3FfaW1wbAooMy1wYXJhbSwgZm9yIHZlcmlmaWVy
J3MgZmluZF9rZnVuY19pbXBsX3Byb3RvKSBhbmQgcmV3cml0ZXMKc2N4X2JwZl9jcmVhdGVfZHNx
IHRvIDItcGFyYW0gKGZvciBsaWJicGYga3N5bSBtYXRjaGluZykuCgpZb3UncmUgcmlnaHQgdGhh
dCB0aGUgZGVzaWduIGdvYWwgd2FzIHRvIGF2b2lkIHBhaG9sZSBkZXBlbmRlbmNpZXMgLQp0aGUg
aW1wbGVtZW50YXRpb24gY291bGQgYmUgZml4ZWQgaW4gcmVzb2x2ZV9idGZpZHMgdG8gaGFuZGxl
IHRoZQpuby1ERUNMX1RBRyBjYXNlLiBCdXQgdW50aWwgc3VjaCBhIGZpeCBsYW5kcywgdGhlIGRl
cGVuZGVuY3kgZXhpc3RzCmluIHByYWN0aWNlLiBKb25hdGhhbiBDb3JiZXQgc3VnZ2VzdGVkIHJh
aXNpbmcgdGhlIG1pbmltdW0gdmVyc2lvbiBpbgp0aGUgcmVxdWlyZW1lbnRzIHRhYmxlIHRvIDEu
MjYsIHdoaWNoIHNlZW1zIHRoZSBjbGVhbmVzdCBmaXguCgpTaWduZWQtb2ZmLWJ5OiB6aGlkYW8g
c3UgPHN1emhpZGFvQHhpYW9taS5jb20+Cg==
