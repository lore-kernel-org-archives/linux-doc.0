Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794939219;
	b=jBsJ+FkeMuJW38hHUzwTU3OkdmakH3bgEpmlg956HAon+UzH3i+etkrHCmeXRzSU3iRX
	 +djAnlrOoMa3ohawrRP+jH2Iou3Vr/HYB8HMFB4Xolt5rWGG2qkk9DUY3bxKiSnAxkHNA
	 ewq9TCJDYaSRNkjPhwjoYO2+NpId8gF7WUNr26f9Jul2XopJVzXI3bHG2bDmbirTXjxod
	 Hqz4h9ERs4H+XGjpuUetzgZBBlwmbcwxNcuuc1x9EZSnjIzZQaIuX4maRK5f+QbpFBTz5
	 aTNPbShTN7xcHxXQkYwWrrmbzUvr5UFfcQlN0SxEPtue//gS6qI+KdSPuzNw9iQ+wwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
	b=gzQoM3jAagLpc36wNQZlF8KBBBoaY9T0c41PvYvAEbLJHEiCG1fNWADeMrlOkWBYdi18
	 +aEjK5Yi1KHHJASyUdb7TSRg9Tn6/ZzitZiwpV6ind4uLUUEnN3uTrUK4nOOvehm3UsGV
	 KdujMh9YLmuDMrRSVlRwwViH/4HfmUzFNlNKn01KDZfX8niQC/g+kg5QdCeNcA3k4fGaY
	 2vLTn5y8vvZ9fXNHIk5h961eCk6OvRD1ijkEwv98yyXHLGNr7mDbCmS2+KbVzQEzMJUUZ
	 rLoroBL/v4eLewNIk2iwI7TEdlHVGxkvNP7zreiltY+8JXTuYTkpBJ72HQVNBymnU+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWq8fIRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEDD606A8BB
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 18:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EEDD606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWq8fIRK
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso2134091fa.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 10:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794939217; cv=none;
        d=google.com; s=arc-20260327;
        b=X2Ih3eukbknITppUV+4Ptwmytb5L0vB0d92u6BVGSjWyDbNJo5vlKNhfV63pmqR4Qx
         xoUM8Jc0lPDC4NS+OYX6uSWKF3VkFNan5+Y9BDQH5FUgaAtACB881ZwC6ATNLjQBQA6V
         MSjiXmrIjCCacfYBQUXc67npy4FgCexUDm7RdWFJPajVCvihVC6xcemdWUi5GoggxuN/
         hyu3pQWr+mu6FF5yqObzbDzIwTfwjx1CUPFhG3fcSmFo61gFsug1IoSHT6S+uugEJ1Bm
         JKcqYbrULLn0omBaswON26kSX+osjxgEUI4XAbutgotrRH/nnK/OZ4z2HGvCmSMJTaEW
         nykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        fh=IKnQ3SWGg3/E1Y8ySNCZeNGc6X91ilkT0j2GxQEy+GI=;
        b=psK4+VrUk+HBvbabQr6Y6f3V6qKluM8BAQngTGaDFFQBkckD6NL5mJloYvSqex2il+
         dx0jJAaMS8ArqCAL6AqklTodKlSbdGEk84SzM8yZl3MHNwxj8Hy81FzDPxGInr6+zw8x
         Xm1b6bRdXfuwT0SVhW4TQkQg3OEdoqoXV62TqoDeC4hppdHk0WtaLJom9sG+F56WY89E
         l1bjN+0egrEiFtYOQfiDZyyjb/7g53UmdnPoet4heJ5ierFthCFFlOGv1wXy4vHxCi9A
         surnVZKx2RDrtG0PxVdl9xPr8PNrsPp24H6LHEePt9SYqt3wabdv0FTHqppXS78qDpIK
         ALRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939217; x=1795544017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        b=yWq8fIRKsYvOVYJkN+zuhrDf5zzTzUqBNqndE5f6I0NuyPm5k1QYBU1TxuA6LUrayP
         u9g/rJO1y8oNXunkiwTxK/PEnIDGWko/TH/y6fdqeoZVr5MsQ38hY+z2KpG3sgq6BJWk
         Uk+PxgsWz4df/3Q3gszOS0a28AGCRXK7qrNrs1liYe8mvfvy0RnMZDm+HY4rEK2OLNdl
         D2O2ciFFGs/v3uIhVFRIcdDMCp1tY8Cx2whBmtqPrFLKaSr1dI29ZNSeJFdbxCrEUFQW
         HB6ed0+jh3NibJOScnRUnJw3EhuLteXt9rttaO5Wl9w1CYEPMjG8/8bAlAkv7VxP311K
         I4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939217; x=1795544017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        b=sG3UJ9wyVg7sm6H9E0hphg6X/SJteYyaKksvnqeOuRyYJhtnksc0uANhtO085oTZPC
         vh9tPpHvt5CL4v3uOpI5Dd0wsNFS7kOuvRsdr+SUyabPsxjtD/k1wQAC270Vbb2TqnTP
         qtni83kTsZ9r83oppOeVSJucWt2UN/1UV9iMx1weArNkUH5V4v8q42j4jVYjqo2GhFm3
         NF5z4h6+TtOc+u+zcAAiGK3h7UwY5KRhuMFIZkLIdy46PYAn2P4kPhuRqXqp4He0hB73
         hmkPa3/uiH7qO3tNDKs7GUTeu1LiIYBQGxU7F0UloOkOaAqkWQyUYjlIhInoPX5BJBt3
         RjNw==
X-Forwarded-Encrypted: i=1; AL+hErHvS3cbKlQDZt8zchzaIjgC0JBSJADCV9pOyoh+8Gyek39Jj1tchHO5Pj+LJ351rUFz8G730We2Nng=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tnGIgS2ZeiUs3UveKtL7k73UHn1t9eboo04gtMTvk8fx/hdb6
	keEvjG7q9++sI/wBjE4ESK/0+tJzxSPMfzosOtuHQEbf4PYViGLn9fX62rJE+CUffKGLPIfewzk
	JxGdS6ew3cL+yEiT//1hlcIbGTnBZ+vD3TnS9m6duxg==
X-Gm-Gg: AYBFou373D+/wNoLVjs70l2OaXBtY0anFm/GlEiBnTHYAqiaJkFbwpq05wCyYYUum27
	q8KlBWPqwSbIEqSi337IUn3mmVLNfFs77Qv0Z6yacjMfZH00CIRPjMIOJTdT0ueDPDxz279O9YY
	uOEHS3mv+UO6m9LiJt4CPoFulZWZbkzPX26vDp8SaqeriQgAw0be5rNgJKftmcsE3khnySRR6tm
	QtLkWNqdXaKHOnELvbmm+Kg7JmhK+ljBNdX4nQmPRbTPBOxD4Yy0Z/z2N0qNKAnsoOltFj0ld/v
	8Tow8GlfF3NATOqWx0bzrSarlVhMsGfQGHeBHmtmwmMICqvbmYltzyO+1bBvP86XVlpXAW2iHZX
	KD4AkuGlCyB9qfqOaYXzFDJip9RivTvba/3sbgQ723aojThhJ1ckpMpbtimgP4/Zu4aI5Z9w/cd
	qqdCdjS7RQomr/FP3H1q8n9BBoxQy7xIMK/XXQc0DIKJQmU8I=
X-Received: by 2002:a2e:ab0c:0:b0:3ab:f9b:974 with SMTP id 38308e7fff4ca-3ae2b6b6de0mr41375121fa.29.1794939216626;
 Tue, 17 Nov 2026 10:13:36 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-6-ef614eb2e7f1@gmail.com> <71d115df-0380-4724-8cc1-ca7da0aa5fc4@roeck-us.net>
In-Reply-To: <71d115df-0380-4724-8cc1-ca7da0aa5fc4@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:23 -0500
X-Gm-Features: AclHuK_oNiRl-U7dZo5t_PUbIvckg4PZjah-4kUWpzh4pr8I4MHJijK9LPm47r0
Message-ID: <CAEdQ38G0hC3QvZrM-YLUGUT=0DQqjJi=G=CWu=2fUwZLs1wLBQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:13=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> This is not how the update_interval is supposed to be used. update_interv=
al
> is expected to be programmed into the chip.
>
> Soft intervals should be hard-coded.

Understood. v3 drops the update_interval attribute and refreshes a unit
at most once every 10 seconds.

Thanks,
Matt
