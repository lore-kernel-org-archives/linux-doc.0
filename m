Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48578388E7B
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 21:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774992767; cv=pass; b=nwJi9jAO7yqibiHyYqQfSMWmIGPpr4Rpxrmw4g4Bl6I/HcYjNT3+QFxHEbYz9lJuxO4710lv39LwU2pmIiBbQVs6MZcnfFJ27O/KFru1GMLUq/wOmJTjnbIQcDEV74ICD0VcvVDBv7fj77h09zWnrC2oJGr9FZFjjqA/0YfpJCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774992767; c=relaxed/simple;
	bh=GngZGgJtP4SO0vFqm+efvF1/qCydf+V2qkAWX0y+7wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQ7TqhR9mKJmOgdLLGTP1w8VkqTN0R8r6LcrbYzZa40HZ3GINnA48fVXXvOEViCgx2u09wnah/1Mo7X1RujUMACwt58hrSIoF3rz+6JYTYpyv2tDO2v8KYysK3ci7RNaRDm95XgqaH3FRMDokj1OOPdpxlbsyUfujEsIAZjrldY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPkggVp6; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPkggVp6"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-67d52ba8458so234072eaf.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 14:32:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774992765; cv=none;
        d=google.com; s=arc-20240605;
        b=cmjHVDjr390Uq6n/TbjqJ/q3rtpksrgWnrFSwYqZUzxlAIBcEAISByINVFo3LIe0HH
         zMWx9cSNja1s/WKNhASYWXU7YVpRtA3UcfsME/V3MfrN6HKv4YH0yx2B7hEDVUiMSDCW
         k9ug56fAWsTdGvtw1FCQZuFA4EioVqyQmCuPlMC1f5ADrvw5ulGEasRGwekSwbmOSDQ8
         IFpbUCgILl+lfTa+IhVQKz2uJeazgoSdoZJ7o3UnEf8byPkgOzcBaWa8sRN40jce0IjO
         K2HoMAFBAWbpbdDM6ZRrT8rmrQhCR3hGxDWv9IhLTZmFi7MrBLH8XLxhG7imBupSmFu4
         3Uhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQLSbpCxtav6DiGh4O7zLHJijHVOoDoN5S2JLUyndfI=;
        fh=ErG/UPHlF35W8her3beWPQbvHlVNcpagygLVZXbX8xY=;
        b=heGmD5BbNSjgC8WlNDFDcyrn54FPLKXUrxLdgis/pJ/cSpCKhiN/gupsXeGzJJ0FcU
         fk3ZP+iKTekSxz9ph1QjGsQge2L5BL5LAviKlkFbBEvilgoD6ecK2LwL0S/uCjk224zM
         mWeqPv3wPEIpBuDd2EWYDG5+jqMbxxj/qbltjtEMP6yj78BUR0Rkxrhh/Zk6n+V7J+jG
         6RdB3vBr3dbrM/LaXY6rhywt1hMTvOP/zHwRROHEmSFQAI8ZCgJnuu7Gk9lCJAIBSaL+
         SEfGbSpiiQxe0JNRk47QcXueytJ9/7idzn9Xf53nUxvSI5yLQ02lqPeRoPS9CK4HEa6h
         KTCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774992765; x=1775597565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQLSbpCxtav6DiGh4O7zLHJijHVOoDoN5S2JLUyndfI=;
        b=sPkggVp6+DJ7NzojUh3SM0TnKW2q6hhf0Nb8jjj/7ngC+e5XBGpAj+pOzwcOl6Otvv
         zOglgMmfc9dqMcSVRXWNCYIsJ5yxCHdTkH+/9r3VuoR5aTIBmYWg7bfdBn4OIuati3LF
         FRYtUZRTgKspaAsa6Y1HCZNd8vE14n8YRMX4tEcs/R7QiOd1zq8DUiDLKTWx/Us2SqUS
         spe26tl2XXVZYN57i91UQHTnk+ZfkgDVVhCfzcp4zIpmf3xH3t5NuG9bAAhPJd5AdHYC
         PvQdsD34/GqQoHAjPk9Ylvp2AjR/DuC+SHq0UeJ40KI7t10+KnW9FY5NRnwBT4daLzjE
         +rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774992765; x=1775597565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zQLSbpCxtav6DiGh4O7zLHJijHVOoDoN5S2JLUyndfI=;
        b=jIzgKGWqClOi7vItJtE+qcKMtfjYvUmP7ZLvk9xbUS3OOHeXteWvx9U0Cex32mn+X0
         UL6E/kepGQTv01NkPO4wBqK5yvztO8kIRMdK19cFEFRAGlGBNbZLuQxKis6vekhEjRt8
         UC9mKeSgLDWebH1RSHs38VaCIKiyH6ZgPE6akHjjwh+Myt2c1oVE3Y/T6Gberd6ddYLC
         U21dUJhaAQ4TGR3v9bLIeQIi3TvxMTOoQSkhRaxOs4s3c9VjUnij+l5b2F9JQeLDyJlk
         xvutXozI1bEsVfyrjCXr2bdg2Pn1NME6LByLDOTvX6GlpkPVtNIqAw46PwFmzj3dz4Fg
         ckkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhK/cj2pYzRLMhsvDQ7kykQx8m+2fTVyc2Mz6y5Sfg8LJ/rTpRKilUxfrqnhS7wicJffvVEqRrlvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjeJA2x2efXjt5J1e/qXgL5+n+vcUPYctCTgFbc5pdH9V3Yk+V
	HlqEu19aWKgSPlkrkdWavuULGAIzFjYLW8A1bzVJVtwoRQRpMi1khtePUWBayCrLRUBqoCt2s65
	XmjvJBc8g11vZ/Ws6zfxNvKkqpUY0Utc=
X-Gm-Gg: ATEYQzxEdf9D16aL3pclIirnXLj+PDhGlCX8JII9XZMnBBOi0jVs6npRB4TIfS0zioA
	lcJe4HFNZIndIP/VyYoZajU6+oERQH/RnA8dpNdjSxxhyqLheBqP5809ahiGlfNlklGu0q2Gr7P
	Epk67ASlP8sLYsiOmBd829EO6fPIAiTvXHBTE5YeOWyrOdzJBSMleWtNoZ/+tjUiuMR6qzm18oP
	3F6dquM8ZubICc4TEjIeMxMVy7eyfkfabw1rDtvNLcDJ4dweSq+BTSZYEH8bBViU5R5Kgec+gJn
	18jXPz9CKQhlgYGb63FfkB61tC6vXSnZjCvKlbVxxbPLxCA/xPHXp3zNxfDWsuD51YsP5OEmO6D
	4G6IdbsT7
X-Received: by 2002:a05:6820:229f:b0:67c:1fa3:ae6e with SMTP id
 006d021491bc7-67e3d8b5cf7mr3092610eaf.8.1774992765044; Tue, 31 Mar 2026
 14:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329165041.831369-1-danielmaraboo@gmail.com> <177488383987.1817745.16164460917376587462.b4-review@b4>
In-Reply-To: <177488383987.1817745.16164460917376587462.b4-review@b4>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 31 Mar 2026 18:32:34 -0300
X-Gm-Features: AQROBzCoRz3wWJtKYhHT_PQV3huPcdPmpiezYZmkLGBm0C4cIdTWJnTjRp1cpOA
Message-ID: <CAMAsx6c69qxkCwz=BpYAjCCcvWuFkytL2nKb-xO73T=qOJM4Kw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] docs: pt_BR: Complete PGP maintainer guide translation
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 12:17=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Sun, 29 Mar 2026 13:50:34 -0300, Daniel Pereira <danielmaraboo@gmail.c=
om> wrote:
> > This series provides the complete Brazilian Portuguese translation for
> > the Kernel Maintainer PGP guide. The translation was divided into
> > subsequent patches to facilitate review, covering PGP basics, hardware
> > tokens (smartcards), Git integration, and identity verification.
>
> Thank you for providing this translation. My Portuguese is not great --
> I mostly nerded out one year after attending the Kernel Summit in Lisbon
> to get myself to a decent level of reading fluency, but haven't kept it
> up in a while. This translation was a fun refresher, so thank you for
> the opportunity. Please take all my comments with a large grain of salt
> as coming from someone for whom Portuguese is a 5th or 6th foreign
> language.
>
> >
> > All internal cross-references were updated to ensure a clean Sphinx
> > build, and terminology aligns with the existing pt_BR documentation.
> >
> > Changes in v2:
> > - Fixed translation of "Periodic release snapshots" to "Arquivos
> >   tarballs por release" as suggested by Mauro Carvalho Chehab.
> > - Corrected a double-hyphen formatting error in the first translation
> >   patch.
> > - Added missing Signed-off-by and fixed line wrapping in the
> >   KVM index patch (1/5).
> > - Rebased onto the latest docs-next branch.
> >
> > Daniel Pereira (5):
> >   docs: add maintainer-kvm-x86 to maintainer-handbooks index
>
> I don't think this belongs in this series.
>
> >   docs: pt_BR: start translation of the PGP maintainer guide
> >   docs: pt_BR: continue PGP guide translation
> >   docs: pt_BR: continue PGP guide: Git and maintenance
> >   docs: pt_BR: complete PGP guide translation
>
> I don't think the translation needs to be split into 4 patches. Just
> submit it as a single translated document.
>
> --
> KR
>

Hello Konstantin,

Thank you for the feedback on this patch series. You are absolutely
correct that the patch docs: add maintainer-kvm-x86 to
maintainer-handbooks index does not belong with the PGP translation
work.
1

It was my mistake; I realized I had missed including this simple
addition in my previous patches, and since it was a single-line fix, I
included it as patch 1/5 to correct the omission quickly.

I will make sure to keep future patch series strictly focused on a single t=
opic.

Regards,

Daniel Pereira
