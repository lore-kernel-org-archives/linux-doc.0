Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.202
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794736397;
	b=1M0XZaewCXoU+wQUDrvkDWEOhjjIN03XEP3oDHhUgbN6NFViQfSOqweirIcu2szFDprA
	 s7XMMaqFRRW/7zwwYLSEpd09L1y0BEo7YmDm9r9n+MmyD0SkivgXUfknCQrHIXSI0vHZB
	 vfyFpNIE7RB0nhlFQ+E7sB7lEUAb5mwtV2fiUIOVsyuQvCWGnwBOd9tH9uempgwslH0GU
	 V6ZGyHmHTHpvYJb6UQM7Wu90Ax2sY34p4W/MQUCYjmUyUF8EAGWalxSdRXgZ9f4yanKiz
	 uBqAWR6l6cG88V0ldBiSc+PMjzxHsEOe2es4l+3I2QzEM0qfaV0x9HXD/mDEsDAzgxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=efXNhlHEowKt9dg8T6Ua+qGUQ2u3K/ispp+N3lzQGXo=;
	b=vn7Ox2mobBJEW3Vd51AplAdK7Th2g1Ry1kZt5+CJA6/fgJ6yITDLTBY8o//XllYrNX/I
	 LF9fzeqp87ZjaXDtDZWLhJHyYMejO2ZsoKVk7TXMz9TD9X3P8dfAlnak+MOjV4TH5WdeS
	 IRzeGz3KL/4FSojPHUyLZeYIXUzu9BqniIVluPyE7lKCULSrAHTEWpYTKv88eRS4hqMUp
	 XFcyCNzKwdZoA+il+dHjYKchfnCnZFA40YWW+fyTJ2AGDv3dDLoqw7Y6LKe649HgJwZTT
	 8Bs2PpYRZGG/MDQYdNdLOt+7eJ2EVeYsp340zdjLZidYYAoEszJKBPWvlBVNmZ4UwsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1C1cgFP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.202
Received: from mail-qk2-f10.google.com (mail-qk2-f10.google.com [74.125.230.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69930606A31E
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 09:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69930606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1C1cgFP
Received: by mail-qk2-f10.google.com with SMTP id d75a77b69052e-5365d232b70so15783221cf.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 01:53:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794736396; cv=none;
        d=google.com; s=arc-20260327;
        b=Fb3Rt4sVLbEe+G4s7mCAxDrGL3qRxir7Ylo6dyM/KkN4rnO1YM67z/9ACAbD7lyqmu
         FOWVFhRuGSn6Exu+I0GsVPxKw6POG56lqTtRRrH73wKfYjIgPshI0YzWp4slSTmqIyHW
         SfVLYSoaG9f7buZgwT3hUGS2ERQ06C1YNe6AloGNeJ7w0+8JPqJC8M6EbzNXk33qSAX2
         9SvjCnTRn18L5vZVssJRkRNeSmH/nABbQHujUMyzE1akNBHywfmlz+jGE9I4P/OgKukd
         1ltZ9vfgf/Z/HaDxcrkrjJLgGEfCWILcluNdphQtytM0dF3CYO3oU/EmaTIOX+74uLYa
         d9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=efXNhlHEowKt9dg8T6Ua+qGUQ2u3K/ispp+N3lzQGXo=;
        fh=7z9BIKNLiXCpcPqnTIlXMsRSWUSQjF6dSiQ78SSZ2Bo=;
        b=Gz9A1U4SQvN9Gk/svD187PaqUelk8TBLdGWugRUE2h8fnNZVgX/6Y0zDBpb7cSCFSm
         iZ2qW+n2P63CHDYXiJmrPDz6fDMOYWa5P6IRA18h+/0jMiyOCD5KkHCtkdS8/iZ1bJYh
         qfQ1+HeN/uIdVVPOY/SXNeR2s/5/wOYZy7kCaO8MLZOxahC55SlvKwsLbETeqVtU980Y
         zAIYdWFW12a6r05k3K4tt3cGj0SguJ8NyNqpqI3meO7hqEKYrb0uEpItLiA54ZqFJK9+
         ysfRalJDOFHAzoriZisiQ0RfER1d4VzyygUdfVWoUUZVF9mYfwh/3P/ZMtiwI7Rd97S8
         h1Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794736396; x=1795341196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=efXNhlHEowKt9dg8T6Ua+qGUQ2u3K/ispp+N3lzQGXo=;
        b=i1C1cgFPGygjTdLz9ZP2JfTQtB7N08hB1v8oeV9xn6V0VyIRXQYfJQxH0u/4K8edtV
         2I8iWnAmIOPWMnM5JESk/rFu1Fw6kfcjBFYhiF+ezdb8CxOzJxi4kpDDJebYEEI2CdtM
         qiUIqvIeH4jgB+6RGa4i+XAT/yP0WmlsIrmQYCtHOAlNnscuhUbTrY1fAv/eCXvb15hl
         9U0EqlRFjKVX2euUJNKZzPpfRcLBi+r5oHD/QCwQ9dBw4rHg/fr03n1DVeuEcYMwoShX
         lJAplcbQ8mRNpDk5fpcu5DWl/uxQV69SUwxR9ASL7IgQzDH3S6RswgTb7Bc1+h+mFY/o
         irIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736396; x=1795341196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efXNhlHEowKt9dg8T6Ua+qGUQ2u3K/ispp+N3lzQGXo=;
        b=zLXIBh5xQpMkwto7hQu3T4veDDphNO4JdpzUnd71S+38epZS0sBsf3Bq495zQA1zc4
         h5Y6WxSY7wxhufJq8UUFVrCp6G4zUw/4/zcB/twnRYkaXRNIEOuemgpUljKnaxoo1gKj
         gdQDRy/2xvmvlr6v2VOPOvC5YQeImX4MPiEyXNkQLhTm21Tu1XTQxwuwoQcqkoTHrbrR
         YxtG7l8K03mAp267Y5e0VBTlGHTKFG+NDMVHLW5YlamljgNN6B7ABi9zqCrKjdxCgnmC
         iTMSyXv1DBAMCInO/j/toI6vXloW5SMQB2xvqlIRAZrQDVhCKLmjsh6JE8ctzr9KFj0m
         BynA==
X-Forwarded-Encrypted: i=1; AL+hErFU0bR9XOd/0Mc11TuvDDFYl+6iEcg6kwhLNadLtKZ8mR53590XleB0WPCw2ERFjgePTFuMS+wz8rY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sLQQ86hXdo/n9W+5OCTDXA3NbNMRtVMPnWKIIhR/HfM8UdY9/
	SzjKb62u3do+aJ1E0sqPdw24FoYJPbiSRD0I/rOIGN6V+6sIrXJgpzJxgZJYxYwiK3X3sgVHgrX
	EgRyxSza6BOLbzDPvzeMpSUvct1pdCzqweld+4gB7FQ==
X-Gm-Gg: AYBFou0OfS7yu4oaDW/msCSedh+HJSxPiaf8oKvNaAnL9lQyCxiTlbjBlFP6PfRTTgq
	0gwSK6rp9Uc5vB05Q3ApGlLYDNM65/BefhIllGrqSQzWW+n7oT+UBSU0VJeCCuoHXoo6YNpN9/6
	WYe/aj5M4K6gEahkZoGe9+dNMEJzwdShy+C1kvAoNq7IP9xNNqAGWx1gmBwOOo+OlWH8VLpt2Sr
	xgTNAai0VLzzMjLTs35JbcLV3LvEp+Ahd4s9QELHd94VVGxTgrIzyk41BRh8shxjq+YThUWShVZ
	gO/mipDUf6LAGvh5cCpW9U/KU86hX3aSNH3ds3qIj6iGZKS5Z3h8tA7youblvAL5RjA8lJRnIF5
	iVSnSGqRQDtIBC6QX5wYqahYDY8h2mYi6I61wSLSSaIBpjDYoJuUPpY4vUEi8s7eJNEIAp4yfle
	GDoYHLrUpyf5W7ILt/dOLKXsbOZHhOrumHm+IPkYJ5gMELii8GaQ==
X-Received: by 2002:a05:622a:e44d:20b0:55b:b0a2:248b with SMTP id
 d75a77b69052e-55bb0a235a2mr61661011cf.34.1794736396437; Sun, 15 Nov 2026
 01:53:16 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106135816.391285-1-thisisforspotifyvikash@gmail.com>
 <20261106143022.412406-1-thisisforspotifyvikash@gmail.com> <CABkQbGJYRCts2h+U-7NxrY1+k6_Wo_bStnt8heJHL18b7yg_wg@mail.gmail.com>
In-Reply-To: <CABkQbGJYRCts2h+U-7NxrY1+k6_Wo_bStnt8heJHL18b7yg_wg@mail.gmail.com>
From: ss vikash <thisisforspotifyvikash@gmail.com>
Date: Sun, 15 Nov 2026 09:53:05 +0000
X-Gm-Features: AclHuK8WYya6WSyHbStkzU53YV3t6pJrBwVKMJroJJg-Mf0c4sh-6ZdMjfqaS74
Message-ID: <CABkQbGK2QV4riT9Q9mXBtHgxDJfLLeXN-YPR2hb7fewTWJcu_g@mail.gmail.com>
Subject: Re: [PATCH v2] netfilter: conntrack: document sparse hash table eviction
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org, fw@strlen.de, linux-doc@vger.kernel.org, 
	corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pablo,

Just following up on the v2 patch submitted on November 6, which
incorporates your suggested wording.

Would you have any further comments, or is there anything else needed
from my side?


On Sun, Nov 15, 2026 at 9:48=E2=80=AFAM ss vikash
<thisisforspotifyvikash@gmail.com> wrote:
>
> Hi Pablo,
>
> Just following up on the v2 patch submitted on November 6, which incorpor=
ates your suggested wording.
>
> Would you have any further comments, or is there anything else needed fro=
m my side?
>
>
>
> On Fri, Nov 6, 2026 at 2:30=E2=80=AFPM Vikash SS <thisisforspotifyvikash@=
gmail.com> wrote:
>>
>> When nf_conntrack_max is significantly smaller than
>> nf_conntrack_buckets, the hash table can become sparsely populated.
>>
>> The early_drop() path examines at most 8 consecutive hash buckets
>> when searching for eviction candidates. Under table exhaustion,
>> this bounded search may fail to find an eligible entry even when
>> evictable connections exist elsewhere in the table.
>>
>> Document this limitation to clarify the implications of configuring
>> nf_conntrack_max significantly below nf_conntrack_buckets.
>>
>> Signed-off-by: Vikash SS <thisisforspotifyvikash@gmail.com>
>> ---
>>  Changes in v2:
>>  - Reword documentation to provide configuration guidance,
>>    as suggested by Pablo Neira Ayuso.
>>
>>  Documentation/networking/nf_conntrack-sysctl.rst | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/networking/nf_conntrack-sysctl.rst b/Document=
ation/networking/nf_conntrack-sysctl.rst
>> index 4426cce2a..c7e9016ac 100644
>> --- a/Documentation/networking/nf_conntrack-sysctl.rst
>> +++ b/Documentation/networking/nf_conntrack-sysctl.rst
>> @@ -99,6 +99,10 @@ nf_conntrack_max - INTEGER
>>          the reversed address). This means that with default settings a =
maxed-out
>>          table will have a average hash chain length of 2, not 1.
>>
>> +        Make sure nf_conntrack_max is equal to or larger than
>> +        nf_conntrack_buckets, otherwise early drop may fail to evict
>> +        entries when it gets full.
>> +
>>  nf_conntrack_tcp_be_liberal - BOOLEAN
>>         - 0 - disabled (default)
>>         - not 0 - enabled
>> --
>> 2.34.1
>>
