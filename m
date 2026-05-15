Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9EC44D693
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841852; cv=none; b=MVRK2WK6FkjbY5APFDSpQPq04fhOnssFsR0NLPqre+sAPB8NfzZpzdk/g9iCE0iahBGK9nntelIN5+KbYVebtra0VR4USeDXmeh1wetEd1KY3KLq5PYhbC3HAw6wzmRy+0PiDTyEu/faLfpVEJuzfVFW5iHGUfS+gy2Gy+YUgZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841852; c=relaxed/simple;
	bh=KY2AsiNurTVnvLiWPzPFhGLyjj1bek8yErHVAyYOqSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPLCJmTQUBajlLd/yWBZB8Kh+gbDZz5Li2WKMLRcT+8rtaKdK7b5bVVTdmw+Hq1Fr6V+iKjUFtST66PI/7YsEHcNJGGID/UgTrFkSrsKb0trsVYo/rsyqb5H/8UwklXnxtMIiSTLkDw9faYmMII2YNbn8/zGD+edFVB1k7oH7uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XrGAiYwI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XrGAiYwI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso61643215e9.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778841849; x=1779446649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY2AsiNurTVnvLiWPzPFhGLyjj1bek8yErHVAyYOqSw=;
        b=XrGAiYwIr2dKY1PTNS/stITMQcIC5apkmZKM4j+SZEBrGnt3hd2uuy8T5VMvCM67hX
         SmD0wdaMoNmXJ0oUsX8drTgiZNr+vDPvzau4W5tx9LDYbBdUsx+MRV/wMlieHjqsghQF
         Fn+4CLFtsYTJVKuoJKUYsKJroP+/2CoFyH/m6CLFyMBTE6+QPrmCg1KJ9VeHZyKQ9Orm
         3gDQawO8bHr18pAvn9U6V53O1bkz2Zsqmgn7EyXUbdNpKxOBRxlWBfZJCMFDPUEjYK87
         upY1jeEOiw9+PbbG2T+qsn3idQY61rcICgSxbPgUMrXBhePIjBEAlQfMtfQcrK805aMh
         XgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841849; x=1779446649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KY2AsiNurTVnvLiWPzPFhGLyjj1bek8yErHVAyYOqSw=;
        b=ZB5VZvEUGptfzUgtqWXKmJU29iKO3aawJBJdm4xQuwKEv0V+j1B6/u64sAULHeRetc
         zRliw5fMmRGx3J0jb+FIyBZyb4ij9M5BtDOBhNsVFkmzE+wn7/h1SQg2XrVUTZLyicVR
         /Gw6hcqs6WiSssPDOYE9QTO/mRmYBdpHvic8QAyibxX9OzD401861VRAgF3s6xUlFtBm
         ok1CRvRyr0DNR+N+14rY4X44U8aui5tP00ogvbDgOvJDluK92gc9QwFaCrSK16sZqFnj
         iclMA+XNfW+6bidfs4cZ74m9YtdVQMvXHW+Nxu6ehpodZ83r9LKUrSnPCDrD1P/mGuTY
         mU4w==
X-Forwarded-Encrypted: i=1; AFNElJ/z/ZFCJR9o8FaWhwfOjBbRTCHGnEVl11hgpwhg3hFyUxmjAklfZpXpc5w8kMpZ0yMSBjgIaE3FS10=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr5z0fkpyVfDjNsRWjP14hI2NE4bse0ORktpIcJpRvSd8gKKUH
	CaMGqAp6F4fI7YsoOEv2JIEAlNLQGSRiyKgELDl8HYQSh5/y1eoXKB2XKLcQ2MaJQUo=
X-Gm-Gg: Acq92OH+a+7PlxhLRIZmqXIpR+pPggQMSrJ7aByPyd/iNqrSrA9xJmElOkCdQEheVBt
	h5DO+qAFH8+YEJCBm2fz9wwiEcNoDpl2xO1PK+xpZvmOftBYYejkl/EPbfP0QWQcfEpGUXsSHQb
	68uZFCO/hYtZzLi0OwuZ59L4TO8ORj/ZwswKHghZhL0yFmHs2R3up6TmqFsbd17HXevIqXT/14g
	3SfBpxK0Db/XUjib7Et3t2ImQ9gh2H1rqI6DZqeOh1bagvH9Ij9chSVT/in/XCtf79VvGYlA47P
	F0lzkKH6PRsXUzvXmairMgiyqUsaFu9Bt5rmzBWNiv3GoWA0S/o6SyWWo1gg+3hDYwuUhvNUGCy
	zFIsAMSaOInjZaKLzm3F9bd4Sa0eAYFSt67BtqG5JZOaSpUO0mRJC17fLFGr9dmK1uEqo+hK5ax
	lYPOJJKrVFjiRpwcMtbVxatHD3kByroZf7YOoVw9tH66uShH/cYIom5d7ef6nfwvo1s7tAi9QKp
	MFf
X-Received: by 2002:a05:600c:2d09:b0:48f:e1ac:c96d with SMTP id 5b1f17b1804b1-48fe61f2bcemr25319745e9.20.1778841849271;
        Fri, 15 May 2026 03:44:09 -0700 (PDT)
Received: from precision (ppp-88-217-117-152.dynamic.mnet-online.de. [88.217.117.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab52a6sm50484945e9.10.2026.05.15.03.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:44:09 -0700 (PDT)
From: Henrique Carvalho <henrique.carvalho@suse.com>
To: linkinjeon@kernel.org
Cc: corbet@lwn.net,
	ematsumiya@suse.de,
	henrique.carvalho@suse.com,
	linux-cifs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	metze@samba.org,
	sfrench@samba.org
Subject: Re: [PATCH v2 11/11] docs: smb: document SMB3 over QUIC setup for cifs.ko and ksmbd.ko
Date: Fri, 15 May 2026 07:44:05 -0300
Message-ID: <20260515104406.10075-1-henrique.carvalho@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAKYAXd9QWJFB8oPGZaDjWhEPYJXiDRmiKZgVUwmKKUjeQPDiFw@mail.gmail.com>
References: <CAKYAXd9QWJFB8oPGZaDjWhEPYJXiDRmiKZgVUwmKKUjeQPDiFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sure, will do.
