Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F936443E20
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 20:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667452; cv=none; b=CjoxJhKHBKo5tnjo1Z5DMCrZHOlCjCf4aHQfCseGtyZq/ccWZIQ5QXLSPQEYWSZvJekRtNfWrsFTHc1PpDY7PEkJS3Dy4FavZs9miHGKVJfgCRd5xzmzs22orZ2lCOqG4YjsiNkQBcgMPlBc9Nn+Pye8/9CjkZby4gImUwIZHHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667452; c=relaxed/simple;
	bh=yfxjNCD2FfV6WQ7UCS9hJEIU3/cj9TtYhccgD7F2GOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hsLboOKYH7pUzixJVF8PyT17Arn+vXP9UrzkpkHkEl52SThpYozZyoJaYOnfgJ4LZAk3P45xqet3/rxnVcr4xZG933/A0zbexdPhwUNQ/fIzXuUoCHIVcYj1jfns8KR5GU/0LaoJU22NuYqO9hN0gvRWfdvtF+29CNfqFuwCEHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1i7zzSs; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1i7zzSs"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9ecb1e13bso4405129a34.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667447; x=1785272247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tkpd6XZrbayv1qGlRLm5NJZ/GcnFTR7uIhPPki4vU/s=;
        b=f1i7zzSs4MTch98HP2skO47zoVs0bqER2ez+3htfcbfXAsm0gGHd5pq/lXgpfbKpjz
         nL0g8N4UNVCvt5/G9AP1ZmAzvo2OuEBuQ1h9/ZzHJ5bZF3WiJXtmpUWzf4lU0vQl16nr
         lk0eRNeu2EXDBRsGdQt6NwTPtWZH0Eouokc5gyC5o1NHXCp7ppwiOBf2Er6kscyKxNrG
         hlvrAD6RIMBrWh4VV80JUbtvpl4gUxvZINIl1fvBTRVG8isomQe7OIAX2XS0NDYURW7x
         b9RFgj9lQWzmajle98vqfdB3s9FwXMUUNuKGpRRsFpsuRE8IwEGHG2roA0nMORiZiC6t
         G4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667447; x=1785272247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tkpd6XZrbayv1qGlRLm5NJZ/GcnFTR7uIhPPki4vU/s=;
        b=V0Lxk7/hRmCRjNf8EG4LioMXJMLr2pVb8J5RcNSk6WQOvCed7egi+VZZ4aEybtTt5D
         4hAAqwI3ETzpZW7SvKtDP8/BYVu16p0sTVzSohfYVlgQSvbPX+DkM1KwqFAmJtMtk+Mg
         DcTjxJMKSSk8VtyzwUivkC8tuThmtBXSF47jeAcyhgqaR5vYL2IS1vzBKpwQvMXIqHqB
         iXBvG9NlxlWP9Qz5RwKatR89VyN0V1ugE1IzN5s5E3xzXx0LVx61Muy/cnillM7UuvPF
         Ke20++GDCAcJo4QX/w/jHBDEsRPWGWMBBoeWwRyFogQO+DhNEnaqjdyS1NlolE7a8okT
         gxsw==
X-Forwarded-Encrypted: i=1; AHgh+Rom/JMjtLSIPMyWyjl+8jqj9L6voSYQ6MH6oMFsYhyVT0DZdwNMKgH0MDAwCGr7/gmuPgcdohA0z6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGNU5WHvSdUM05o9+alKSkTfe2MmM8wxN7Q/f+7UnhFDdtJv6I
	Z6lfmGmtsNtEHOvB+ETTSsnMAZhSk17TWg2ookTqWX1fdKBiw4LXGpA0
X-Gm-Gg: AfdE7cmXembqUJ1lfOxnNap4JrdxLlJJJ0S+W/pqHzvHFfHsRTD1NEbQXzKhAnHwXvu
	gAD9TwVxqkmGFrd3b6rKbB3RJqwtTLR+OgnIbLZR4gbSAS5yorv1OHShabGBYzrsAgzIdQ8JMpx
	Eej1ilV1bwQuJYIvTdykBW5jiqzXPtu+93gWmkasnKP0h+UxEkbUB9v7ZaUplggbbi4pLTEBjyW
	LBsM47M9AibDlGV2KX2eMgW0Gh23z7cEIxM2gUUqKCxnqwffveJc/dEJwB8mX0WF6JLdUPdqSqT
	AZ8PY2nHfOYb6Idh51IHEgKQcSg3FksZ+Wziq2gJOQbginsTlITuOna6RQzOinRVDvITqQ0GG1h
	kxCQu3gfYDXca+LVOqgUsuxdA7vqk8VmKs5NxbWfeppZP3yqqM5Tj8Y7qwEU8j0JbMH4d0a98jM
	TWEeoLhOedPkfqVdLq8KjC5q084lSXLW4n+HB+2xPQ7EHcAZ4aFeKZlhmniM3xnuEoB8YsLsgEE
	LJ57BkqxuH6NhGEPZl0jHZcgg==
X-Received: by 2002:a05:6830:909:b0:7e9:dbbe:5af9 with SMTP id 46e09a7af769-7eda4d70994mr10261926a34.31.1784667447247;
        Tue, 21 Jul 2026 13:57:27 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:57:02 -0600
Subject: [PATCH v7 13/29] dyndbg: reword "class unknown," to
 "class:_UNKNOWN_"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-13-010fbe73b311@gmail.com>
References: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
In-Reply-To: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=1375;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=yfxjNCD2FfV6WQ7UCS9hJEIU3/cj9TtYhccgD7F2GOk=;
 b=QF5cQMK6T8UD1YJz5nk2AJgW01BgHiDFKzY+xuJZdV3zwDHcNIHgMuD2tCQNxi+sv49R3fsxO
 T3mOec9MvhtCAxvyJpnSu43qxs3y9ZYtOKNNAHiEMVbFgE2WhPqbHCp
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

When a dyndbg classname is unknown to a kernel module, the callsite is
un-addressable via >control queries, and therefore uncontrollable.

The control-file displays this condition as "class unknown, _id:N"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_ _id:N" to loudly announce the erroneous situation,
and to make it uniquely greppable.

NB: while this might be seen as a user-visible change, this shouldn't
disqualify the change:

a- it reports a classmap coding error condition, which should be
   detected in (or before) review.
b- SHOUTING the error makes it more visible, uniquely greppable.
c- the classmap feature is marked BROKEN for its only current user.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 577a07916072..a86e1d5845e6 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1170,7 +1170,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 

-- 
2.55.0

