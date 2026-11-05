Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875725;
	b=JfJ+YI2Dxp1G5/1n/L2+znCZ/0CtD3h9fZpiwuAsgTqfEjKnvwpHWwJrQxAMMVe6QzSO
	 ZxkyfGUnkeRVTlfw8kZpi1C0nriP69ZVOa3ttDmBA0hQmwx2wUYaqcs2IJuTtTuWgH+Gz
	 tKT3sGL18wE/oylcD9HXAvosZ7hWrqqMefukfyRGfsqmXW7Bh9VAYSN0NdAUJEahDquLQ
	 mSMXWK0zzquhXIuwP0EEiTXrgK3ek1ynw+OVHBfwEgEI6KgwHbYoboGR0VpawgBVUTIMC
	 XLJm+6c5Oqip+AfbtIK2J6qFz9jomV//bZs0K7w8huN28JDw2eb/Lx4ceFShyJt6IxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875725;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 To:Content-Language:From:Subject:Autocrypt:Content-Type;
	bh=OK9v4yeS8DsLgjWTMvLhNI71yy+rj1/7Ge8P3NWT3hY=;
	b=Io01JqBQVv53/cwbzSD8l/W2myMMzdU6WRLuctIKvk4dwA2MX7pfwZrJuX184vl56ID0
	 yoUPMJGplXsJ0R3UbV47KLsanJZOYmgbGQLUFntT/zP8xzagtvjjBf9AFEjkR49gJ/0r4
	 yPeN8pICjELf3PMAhHmWg9em4fKWszawUMC+T+8WxA/oowqQSnmUu2TIjnVGbQjH6Dy7C
	 z1xJlh+nbnWp1ldziO3geKFuQA9XCzVwGqkjFjy6CfAct+LpIYlY5QhDWpWs9s4iOOrr+
	 BZ9f3CNLXllAYq0Al+nfkmjM07YIG+oGLJb51na5IQYSBGCnDg3zsEQ/RQ9L29zZy6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jacobi.pw;
	spf=pass smtp.mailfrom=jacobi.pw;
	dkim=pass header.d=jacobi.pw header.i=@jacobi.pw header.a=rsa-sha256 header.s=key1 header.b="rMJh/V4i";
	arc=none smtp.remote-ip=91.218.175.170
Received: from mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22550606A31B
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 10:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22550606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jacobi.pw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacobi.pw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jacobi.pw header.i=@jacobi.pw header.a=rsa-sha256 header.s=key1 header.b=rMJh/V4i
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OK9v4yeS8DsLgjWTMvLhNI71yy+rj1/7Ge8P3NWT3hY=;
 c=simple/simple; d=jacobi.pw;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793875721; v=1; x=1794480521;
 b=rMJh/V4iuF/+cY+xjWh7dmczZ2SJEYIA1qRp/Ent8JIGeGLOKkLSM5mErPjrYUesPaDFn+pI
 UUcM0rMBCCgQwuaqSUfNZPUl1mJ+veBRiiXzRof2LgDO7G6MuCIzFy3Ld1AY1NI0mG34h0FclZr
 ri87hZdku6QTsVUtPH8YXA4DQd9hcvqt5PYcSmLoGi1hW/3tJ6c+dSEEeOuPkvr58ZiH8+eHohC
 oYRv9jWp3V6B5jToxGITxrqjuRIn2f1x5Ry4zHl3goRoMAkxyY5f7qsfkjY6HXyUBP+1fCPcc04
 CBHIRH3p4j4EcsQ9c6aFDtXPa7g6j5wJZs5pBtc/WBL0A==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b31c0815e72f936b;
	Thu, 05 Nov 2026 10:48:40 +0000
X-Mizu-Trace-ID: b31c0815e72f936b
X-Migadu-Flow: FLOW_OUT
Message-ID: <8610ee11-e1dc-481a-9654-11188a06786a@jacobi.pw>
Date: Thu, 5 Nov 2026 11:48:35 +0100
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
To: linux-doc@vger.kernel.org
Content-Language: en-US, nl
From: Wessel Jacobi <wessel@jacobi.pw>
Subject: Documentation suggestion on Netlink specs: missing fixed-header info
Autocrypt: addr=wessel@jacobi.pw; keydata=
 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
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XIaAV803KJwTQSpKC2NE0b5p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XIaAV803KJwTQSpKC2NE0b5p
Content-Type: multipart/mixed; boundary="------------l0os0reXQXO0qzF23AVT0wtU";
 protected-headers="v1"; hp="clear"
Message-ID: <8610ee11-e1dc-481a-9654-11188a06786a@jacobi.pw>
Date: Thu, 5 Nov 2026 11:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-doc@vger.kernel.org
Content-Language: en-US, nl
From: Wessel Jacobi <wessel@jacobi.pw>
Subject: Documentation suggestion on Netlink specs: missing fixed-header info
Autocrypt: addr=wessel@jacobi.pw; keydata=
 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

--------------l0os0reXQXO0qzF23AVT0wtU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNClRoZSAiZml4ZWQtaGVhZGVyIiBpbmZvcm1hdGlvbiBpcyBtaXNzaW5nIGZv
ciB0aGUgTmV0bGluayBydC1yb3V0ZSANCnNwZWNpZmljYXRpb24gZG9jcy4NClRoaXMgaXMg
cHJldHR5IGVzc2VudGlhbCBpbmZvcm1hdGlvbiBmb3Igd29ya2luZyB3aXRoIE5ldGxpbmss
IGFuZCBJIHdhcyANCnRlYXJpbmcgbXkgaGFpciBvdXQgb24gd2h5IEkgY291bGRuJ3QgZmlu
ZCBpdC4NCg0KQ29tcGFyZSB0aGUgKHZpc2libGUpIGBmaXhlZC1oZWFkZXJgIGF0IFsxXSB3
aXRoIHRoZSAoYWJzZW50KSANCmBmaXhlZC1oZWFkZXJgIGluZm9ybWF0aW9uIG9uIFsyXS4g
VGhlIGBmaXhlZC1oZWFkZXJgIGtleSAqaXMqIHByZXNlbnQgDQppbiB0aGUgc291cmNlIHlh
bWwgYERvY3VtZW50YXRpb24vbmV0bGluay9zcGVjcy9ydC1yb3V0ZS55YW1sYCBbM10sIGJ1
dCANCml0IHNlZW1zIGl0IGRvZXNuJ3QgZ2V0IHJlZmxlY3RlZCBpbiB0aGUgZ2VuZXJhdGVk
IEhUTUwgdmVyc2lvbi4NCg0KVGhlIEhUTUwgZG9jdW1lbnRhdGlvbiB3b3VsZCBiZSBtb3Jl
IHBsZWFzYW50IGFuZCB1c2VmdWwgaWYgaXQgaGFkIGFsbCANCnRoZSByZWxldmFudCBpbmZv
cm1hdGlvbi4NCg0KVGhhbmsgeW91DQoNClsxXTogDQpodHRwczovL3d3dy5rZXJuZWwub3Jn
L2RvYy9odG1sL3Y3LjQtcmMxL25ldGxpbmsvc3BlY3MvcnQtbGluay5odG1sI29wZXJhdGlv
bnMNClsyXTogDQpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y3LjQtcmMxL25l
dGxpbmsvc3BlY3MvcnQtcm91dGUuaHRtbCNvcGVyYXRpb25zDQpbM106IA0KaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgu
Z2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9uZXRsaW5rL3NwZWNzL3J0LXJvdXRlLnlhbWw/aD12
Ny40LXJjMSNuNzA5DQoNCi0tIA0KTWV0IHZyaWVuZGVsaWprZSBncm9ldGVuLA0KV2Vzc2Vs
IEphY29iaQ0KaHR0cHM6Ly93d3cuamFjb2JpLnB3DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KSSBwcmVmZXIgdG8gdXNlIGVuY3J5cHRlZCBlbWFpbC4gTXkgcHVibGlj
IEdQRyBrZXkgZmluZ2VycHJpbnQgaXMgNjA5MiANCkIxQUIgN0Y2MCBBQjc4IDAwMEEgODMz
MSBGQzNBIEE1NDQgQkU1OCBGODEyIGFuZCB0aGUga2V5IGlzIGF2YWlsYWJsZSBhdCANCmh0
dHBzOi8vd3d3LmphY29iaS5wdy9wZ3AudHh0DQoNCg==

--------------l0os0reXQXO0qzF23AVT0wtU--

--------------XIaAV803KJwTQSpKC2NE0b5p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSVJAhkjE1gZ4EDN7FjOd4+RiOW/wUCauxfAwUDAAAAAAAKCRBjOd4+RiOW/6Mo
AP9Eeq6vrD0IBa5CkkwyKn9OhPBLMYDhtUtLnZ2SRGX70wEApZYrmJFsHklYkff8iYRy0XyZZ93E
iTWv3SI7P3Q1ow4=
=HxRl
-----END PGP SIGNATURE-----

--------------XIaAV803KJwTQSpKC2NE0b5p--
