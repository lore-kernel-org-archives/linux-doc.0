Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9C4A3D3B
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 23:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790811028; cv=pass; b=qXCANMwlRIJZVSwGWfnrFLBjWm2AeuSx6HNpG2W8D8GOZdoSV4c+JOePbKI4ihmEVBbMNLIYxUab+j/jG8Fe1V835ID+s6/k8O037a13dMy7zVac/7U3GFaKRMn0C32R6lxy5Db0jRSoYQmUBGKQLCMnu/nQzF2qA2fWe5HKjhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790811028; c=relaxed/simple;
	bh=QRhdhkTWAMq6v8F3o09AfM5+4TNnCKpQ5ExWjqlmZM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+PSeamfp8Y0nBml4DUus0KNsC0WJh1p+KiqAS+GOcFrOWLzBfJEzgfZWnaGK1OGvE3oEaIsuQvNxcDhlD7yFgAzGx5HtaL8TQScbErDro/TAlBB9P25ke2PuyZA4BNZs4OeaJn+vFHo1ebdafD6ojOoJ5e/bHr+F3cG+icT0KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SofLuX+q; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SofLuX+q"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917a64f28d0so4655486d6.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 16:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790811025; cv=none;
        d=google.com; s=arc-20260327;
        b=W89DbiNFUrBj5eb21nPz7r1w+ef9BSRdznXVwfiSh7/yqZtdZwft3yW8FTMFWKE5Ym
         S3HW7R4vlLrORE83CQnfgDPE0U5AFA8fEUyyMiYnqv1qyFOdFGPpMlam/USo6PMtYeDs
         c1ZLkhi9tImNN1JqIM2QiqB23dTTNz17zGSLUDhRU8a8v0JdLCkWkQGw/jsPflxUwtBN
         2NhWBTyOMKdGFq3jCoIGC7ppQqzG9BEPvP/i3Gdm0XBHiUqGOR4p+JBqnHx/gXL0LV7e
         4qu0BQbltoVoTnROxqw4QyiEy4WWXsWoBuT33zLPhc5A0pSWzinJh9jaxWGpm04ixIG7
         dLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F74ktHoo59KmX1dkAk639aZ/tJPOMLAiH0Q+C4A/UsY=;
        fh=VgbsoKtkGHue0Gqjdd6rC41RLZVpjIwWEN6SLmhGXFg=;
        b=kirXV8KQjrwUMNSzAqZ6kHomkLNoE8GOFSqvO6casprRkhued3FZUNc//IcrWa7FiB
         5z2tmD7b/3VTwBiESUoM5z5Nr8hyCo0MRWzLZY4uORrmSn0KC9CXT/i0x0OaLOjnFWTH
         QbUVT3NkGnUCJkMtduCsCVmZdsV5fj8mFsMzLC07YVKrh0R4wtJ01nRxxvW3ExguN6bP
         YCUS9rWnLIaLDRlMLc8RvEySfzkInDQ28mzaVoJkhVhCwYYpKb941l4EoNs6Yp7odJPd
         AjyBzMCJk36m2UiDuP9j7M2RcpmxPSKJqVld/Ie2euU1xvMvbeBPcrMuxNZXa43uEi5l
         r66Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811025; x=1791415825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F74ktHoo59KmX1dkAk639aZ/tJPOMLAiH0Q+C4A/UsY=;
        b=SofLuX+qoadKmbJaTPZ/rAtHdcS0gemHdxYDn73TH7CHtrUIdt9T0hyb+/cq9kMuM0
         M6ARMVLMIcv7Wn9Ilmk3tfWYxXHpUDbZmR5DImQwiYywzeD+R3YfYX6oKN67KrEFTvnG
         gepK8RPnlnRRF1KY8ertt0QP3AuSMwFLMnQnvhqBREGou7U80h1bZKcZTzjjqRKnD7rK
         f7dmGWgMliCepqU0JzkHL/W7FAdjbu72OfjUqw+2mlxlBpLMKkl0rVx7nQutS+Pnjh2+
         zTZ1EKCgMHtzGiqZf2GLklli55PiORuxi7oubJTwCMnEAGM4eJmGBccTb0MCZlm/LPqX
         yGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811025; x=1791415825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F74ktHoo59KmX1dkAk639aZ/tJPOMLAiH0Q+C4A/UsY=;
        b=hhcWZH1iJOAH237zrxsGuar6jpQfZXnAjyaPrbKAjmcNKioyGp5yErIpWPH47NJ47R
         jtRvCvlb1ME324/v2H6QvksbuL4R5ceyxn0V61vlIA10DcdOEQd4VSRCneU9OD+VmGL9
         XGzeFkQ/NYTetjVTeuZlbVNzGTkWR1yAWhU317lQW2xI2GrLAn7Ix022x770XgN+Z+QJ
         56XQoHkI0fDHBzpfpOUBufxLw9Psn0MHEwws7/Sh/7U3JIX/o7p4L1crlCU70VUJzmW0
         SRE6IwS5Y30n601qHHTD+wFGLeb36PrAeyleRBzCEAkjnZq3/PjxyxFf0+WcUuSu24F4
         MFuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqx8hm1kEW4o6kkzD5t7erwOC5dkBqRRVjs9eeTeJHV+Rst9HGIpDm9ATNnBW6M76KOnQTE5k0PBw=@vger.kernel.org
X-Gm-Message-State: AFuF++kmyxJdLMK8AfQ5pg2Y+PC04mcTcJCg9Mbvf0KlU6JZp/YH2C7D
	j9cX6e7TbJ2gkx2P1sOQ4jUJr7+bIzWgfL3jojwlNB1fCL4azKCMZYMnG1vXeYdosovDMMIh4C3
	fkVgNCYDgenLBc2qOJhUCmis9x5uv4PE=
X-Gm-Gg: AYBFou01W325iI/EVjnoP/8KMq6zJm8wDVDeZA3QNfJ2tdqjdg/tNdEOuRmK/nA2nMX
	t9Ws2nNHnop9SVTydat/nr0gOp8dYsf6v7uNQCWLo4loCbAN74EJ8PwqPSuynZJl0AQ55U0KoVD
	oWH/+0UueSqAXR88K20oI/w14pcuclhau6MdsUbJLyBvGWDvRthrUDUFAJilqVleHuuVtX5M8Nv
	uiLOG9gn/Rq/h/Md9WUY/C3tDQOGd+/3bHbaHmiILQJ8gg5T5GeN8KS8/+w2PNU/7EdQXFCHjwf
	Jhd4KBlzVk7SgGMFehD0/XqmFASvf0hLJzf1L4f1GjQTiUWChp6hAgZgU99XRNplgyxy1hFdJj7
	EZ1mBNOvFbd8MWA/b/ykbRQAbrUXkpv3Koq4ToENs+8GrpSbDxsD8Q/BrGA6MbSJ4HRuOjA==
X-Received: by 2002:a05:620a:2682:b0:93b:cb64:25a5 with SMTP id
 af79cd13be357-93cb5a52e38mr239435785a.12.1790811025015; Wed, 30 Sep 2026
 16:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923025148.35637-1-vinicius.m1821@gmail.com> <20260928232540.51083-1-vinicius.m1821@gmail.com>
In-Reply-To: <20260928232540.51083-1-vinicius.m1821@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 30 Sep 2026 20:30:13 -0300
X-Gm-Features: AclHuK8NRbuQAS_waVnj7I_4awYH0UgwVcCCzsszviYWmku8l8ttavFzhdvGZFA
Message-ID: <CAMAsx6fHNXUvUbacySzcnXGWtaQd+-Nqpst-f21582=DS3MgXg@mail.gmail.com>
Subject: Re: [PATCH v4] docs: translations: pt_BR: translate threat-model.rst
To: vinihsr <vinicius.m1821@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 08:25:40PM -0300, vinihsr wrote:

Hi Vini,

Thanks for v4. Two comments about the translation, inline.

> +sem privil=C3=A9gios (por exemplo, debugfs). O acesso a esses recursos p=
or um usu=C3=A1rio
> +que tenha recebido permiss=C3=A3o expl=C3=ADcita de um administrador n=
=C3=A3o constitui uma
> +viola=C3=A7=C3=A3o de seguran=C3=A7a.
> +
> +Bugs que permitem violar os princ=C3=ADpios acima constituem brechas de =
seguran=C3=A7a.

The original uses the same term in both sentences ("does not constitute
a security breach" and "constitute security breaches"), but here it is
translated in two different ways: "viola=C3=A7=C3=A3o de seguran=C3=A7a" an=
d "brechas de
seguran=C3=A7a". Also, "brecha" is closer to "hole" or "gap" than to "breac=
h".
Please use "viola=C3=A7=C3=A3o de seguran=C3=A7a" ("viola=C3=A7=C3=B5es de =
seguran=C3=A7a" in the
plural) in both places, so the document uses a single term.

> +  * capacidade de contornar algumas das medidas de fortifica=C3=A7=C3=A3=
o do kernel sem um
> +    caminho de explora=C3=A7=C3=A3o demonstr=C3=A1vel (por exemplo, cont=
orno de ASLR,
> +    sincroniza=C3=A7=C3=A3o de eventos ou sondagem sem consequ=C3=AAncia=
s demonstr=C3=A1veis).

The original says "events timing". I think "timing" here is about
measuring time, not about synchronization ("sincroniza=C3=A7=C3=A3o" would =
be the
translation of "synchronization"), so something like "temporiza=C3=A7=C3=A3=
o de
eventos" or "medi=C3=A7=C3=A3o do tempo de eventos" may be closer. The orig=
inal is
a bit vague, though, so could you please double check what it means and
adjust if needed?

Thanks,
Daniel
