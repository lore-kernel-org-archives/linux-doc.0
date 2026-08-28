Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D613A83A9
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 22:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787957682; cv=pass; b=caIckwSK8uV92fbg9xEkcvARb+FIQSVTMBm3V3OfyXUpU9I1vvnE7s6Dl2u2MZoJRGBiikUqif0+MbnzNq2Z21o+37jYCpmKsZZW5P5DD4eLTL96jIHfPy9vOibldXaFdriP6G5LQgflQFDskEXEJ6c2/ZtEHmyxBElERiZIlAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787957682; c=relaxed/simple;
	bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kNA9HJgsFXTiTK5sWXiuUvnOgePjbh95WXqKQ5tgKKjMSZNQ6zz4JCJrZ4QBKxswLqL5fU4gWx5pEXJMOWkFZEi+EG8n4aTN1m2Y0a+WCOkUyEaYtuiIFCaIR4b8eT39X3QvTADtryiTM6I6nU+AGVUzwCG9Vhu9tl1OUYhkwSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wl3ePovg; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wl3ePovg"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52fac937235so45201cf.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 15:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787957680; cv=none;
        d=google.com; s=arc-20260327;
        b=kvW5SH3Gi1lN6rrEWnPPVPvZMFbw8NIwV/c5qMs8TbL9ci72U1Az+5XMRwpKe5M3ru
         EjQlKDu1TwF5rN1lgnqglHfFfDGgaLeiL5iLBBbv2hqz5+zuiJlyIPZ792w4WrlJzM32
         l4S+YVsxFAsSMqaeosLKpwKie8MLnUSg2yyZxrDDbzhlQlmoT5dvhvsCZGc4X+JlsFcg
         1UQyO+LNgllUZmvQ1obf5DKhtTQXlnM5XsKJvt0lZmfvS8y9/ZuJOB+NvdgHGQv6Caa7
         RASWkXn1Vmw3cRQxUUbWRiOULWj1T/f6HqKtApyLZrg3ASl6YU8Agika/yt3JnXDcEYv
         yQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
        fh=jsTqgYqKNYnv7c1EyxBGV3W7Fhg6SMdpraxyn5HW45c=;
        b=sVRq83TAlOba8BouOGdsFWrGmhYWWueO3w+Eo8p0/WYxlk5MICi1zErX1CMjVET+JR
         6iMHlzo5XKuFm3LkwRhta4QNva0eWIFd9pTIKbKSSrjqNd1khS8Mpw6VBwjwnVB3TE03
         UUJl/h0uX9nLSmyWmQiUUtotjCmxwsOnObUpu5Cju39F6Nb4P4ddgBxx1fE7a7Yt7SBd
         IvJcgpE8ZESFLzceey/KMmWI2d8+GA4Ks8GNcnTuqTrT5jLzludkZD+Fc8Y85zLHcIUh
         wS9Y8mJbcg7bMGADRhLGsLwykWu7IP9iq6wYhIP1yYaj1QGXqWl+wKZQoituc+8CA4Xw
         EP8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787957680; x=1788562480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
        b=Wl3ePovgS5fvjrS/gq+CySuWQC7t+AbrE92aPHiK7CMboSg08VRJhs+eAGo2JP8rq3
         IgfQNJHMN/tb7gErer5o8rT4yLNfNRmrs4fIlVdUPorUAI7dWoqpgC4GRT/fdOz2e9Ao
         XHTHWQEZ6GQBFNB8oxNNR462YPSgCoS0/IfdPdKmbLH55+RP2VqSgn5rD+Z4Q90oyiXk
         wpe+bLPzKqNrDnKXVnl37Is/xKD4repSWwrL/Y1kMIwlMvnKp7L7R8asD41/BGPyLasF
         fw5tjfgSWu0e/QHOeMlFs+AIx5Wb0hr+Q6E245WixjqGn+lf6AyTGG7xVsGLMu6mvESe
         sbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787957680; x=1788562480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
        b=elfUF2dSPoGGHfKkUo3RIRy1+48AvVkpgRA7rdGUrRQszim6BdxM5R+cJ2+6Wdc8Dt
         VtiISQAGiJd0j0IX6C7RgzXzZXzUlKAcBVFxcSQI1LbZnAVKrfgfFIbFZcRJDajszLov
         ZUyoah2nZYbDmyaLyBtUetCHC4sISzwR1MSbq/SkhCWd9eKCvyZFJkjBwRGvudiSyrrf
         tFJl594ZwyKtUyyMRSgcs1Zv5pmfQVRfsSjPvUuo6kzY7HUED8fKao3/nTO1I9TpqDSm
         0rM4yaOihBSJpkTczAbC4nWQE8mCIt+CPCoHa+hqtH5pgoq1sltfo6SNU2FSp1foeh7W
         JK0g==
X-Forwarded-Encrypted: i=1; AHgh+Rpne5CSIj8BcocwKZqT6WugOZA98oXAx2dh3CjATVQynPk3q5/tt3gqxtSKVpQYU2QQRWToNeMo8dw=@vger.kernel.org
X-Gm-Message-State: AFuF++lreCyzPtkQ2mY//LVVgU08AwQ0zVqhqXdTptj2/zHPbEMx/No2
	H90Sk5XhwoyMAPhjf4b0bDpHwuR1z3uEHAywjSvzx12PRk2knXu2LwiLw4R+99J1BdM4jx9QNlk
	gc0UIN4/LVNXeBJz3uFz+F/XsoEGM6Oo2xXurqFDu
X-Gm-Gg: AR+sD10XHv5LgUo4iNYvSX0h6kqoltSabntE6jTJz3tklmis8h9PZEBmuJK90Q3ZmDK
	sLt71ReNWw3Y3bBhMqQskkg1mLS2AYUszsEx/rQFsi95S7hHcZswPW5lnqXU7JmSWNFvRZuMqNO
	kpiWxGaLY7QTf4bimJhfdGG8C5czw5o4fXjCEeo81hP/qwv2y8z+4tEv7/KPmddJebF5BKCOx5n
	VzcEULVAf/dGi4aQcYLSHLSZ0IcTJN1gApLEhqJUvuAIFEHUAnj+iyc6DNjaLo4zZT8pU1Tfpal
	SsWIkGymt8MYftnO6JjEcFT6AE6WZM5uViijYZjTHiI7AoMYlW4KJUz9s6xMRgyyMNqIhavzY0/
	R
X-Received: by 2002:a05:622a:5a14:b0:51c:6b7:d3de with SMTP id
 d75a77b69052e-52ff716a2admr5298061cf.5.1787957679730; Fri, 28 Aug 2026
 15:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com>
 <20260806020850.1221381-4-rick.p.edgecombe@intel.com> <CAGtprH9ERb_fFG-4JYR1Bjxyyvnk3Ys4q=9ioQz0Cq6QCXtVBw@mail.gmail.com>
 <9c0048b72834e7e88cb278476ad8d19f57373aa9.camel@intel.com>
In-Reply-To: <9c0048b72834e7e88cb278476ad8d19f57373aa9.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:54:28 -0700
X-Gm-Features: AcwNN1UEyg9LUIjstN53o3MhfwwMAKPLjXkthRuE3vRI8Rovt7_F8Pac_E2pZ8A
Message-ID: <CAGtprH870raS09USeB=Ec_TAY8Vke6-nV_LcX6dYZVn=wEhjNg@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] x86/virt/tdx: Add tdx_alloc/free_control_page() helpers
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Huang, Kai" <kai.huang@intel.com>, 
	"Hansen, Dave" <dave.hansen@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, "Wu, Binbin" <binbin.wu@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"hongyu.ning@linux.intel.com" <hongyu.ning@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "Mehta, Sohil" <sohil.mehta@intel.com>, 
	"Gao, Chao" <chao.gao@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:23=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Fri, 2026-08-28 at 12:50 -0700, Vishal Annapurve wrote:
> > Reviewed-by: Vishal Annapurve <vannapurve@google.com> for the
> > SEAMCALLs and the get/put helpers, assuming your are still thinking to
> > shift things a bit between the current and the next patch.
>
> I looked at moving tdx_alloc/free_control_page() to the next patch. But D=
ave's
> comment was more along the lines of just commenting the limitations. So r=
ather
> than disturb the already reviewed patches at this point, I'm just comment=
ed the
> limitations clearly. And then removing the comments when the limitations =
are
> fixed.
>
> So the only only code change here is temporarily prepending the limited
> functions with __.

Sounds good.

>
> Do you want to keep your RBs?

Yeah.

>
> Rick
