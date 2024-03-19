Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C085240867
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710848166; cv=none; b=dMv/CPsQPLgFHKT/MtWGcVBZazZrv3czKvjX4zMkWNzdFPMTbBMP907eQLKlTmQQn28aDsSy9mmH+DOny3WfOkEgPkLWXw41MEZ2tGdfjYc2TkmPVdnePefEFo1EUCswdFjVu9SmCP/sOgJh4sZocyQx65vTlwrvto9xe6tvuMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710848166; c=relaxed/simple;
	bh=kLG3s2ccLlWS8NuaslsuKUzHCRkWyQdfiCjCvrbPtHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIoiuaBnNWbpzC6xDihY/u5OPZrBwMQ/8AnkJcPp2+Z9XXm80+vv1WonDkI7lcgtZADY9FD7F+lJhtgq7sgAH80gYnown49fzvB8aBOYm11ylsZrY0ZOdR/V8tQIUmCSDJ3UL+118KFIwQsRzpTFhVkSLwt6Mh1PzkeTCCUphqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h54PlAJ4; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h54PlAJ4"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so2806201a12.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 04:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710848164; x=1711452964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTM77NdIKvvhD+kTeFGsg6QXrmXZYNoaZiB+blbgaeM=;
        b=h54PlAJ4RgkGVM24ZxFt4V4UsxlW9GIGPXNq5ht7rbjaZDQPXQ0YtpgFIQcMi34LZc
         X3h0CMNdo+tLRVuPNBWd3FmjWq6oYkuWVmNHT0XWjOtSgq50ffYz7dGjH4jRD1tr4iwo
         OXr0kpIBJGBa7glcdgEmhE97NXX8NctR3GG6egm/Nm7FBKVNWxzUouhrBbsutqhh2j8V
         ltRp7epycrw78rAyNo20fcAZfvUs31ScZIsIVFQhWGc89ZA8/686cgmjFVHhyDpCg4KX
         XdgAMsH0RDSTBZgDJsNXWzZNUKu7gL3PklaERYpwHTV4dNcnuZkRkg1e6v1Sum9ZB0x7
         tDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710848164; x=1711452964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTM77NdIKvvhD+kTeFGsg6QXrmXZYNoaZiB+blbgaeM=;
        b=Mzng4cloqaVkgMaMR4h1T6JE60Pdl5xWPrFZq9qQ0BYFTEhhzQm6EdW5uck1uIV3+G
         g3AV2kGJ9uIybIPwnaMrYAXBsBDNf0RNqxvyYWfQfxwkiJmtFk+m/MA+oJHRFcjoFqPc
         RGkW8eU5QlO3gruRdoqgLbw422SZCD0V0TjTbxfQR1EaO+G/JW+q3KhgPsoJ7RJu9WUs
         Uy6/tM3zj/4PyW7U6xUOeK0/TPAWTDvDS+2HVVUBafu30PkGTcjjSHT81A7+iXTVAwxg
         5Vxp9DZgVcO2j5iOeb5Rl3i0fodQhPoq67HP5aWTzl1A4qwqeVnBNe1MKrzTQbbBFoFO
         P+QA==
X-Gm-Message-State: AOJu0YztapugYp85zn8DXXN0hjl42q/6IGbMpEZoKYrf7SWcp/Tn/9HG
	/3CtwmeX2MooOMxqblMYry6D0L3Pn1Q3X0DTiS7HVQrblAwH6QhCj6MtfcCETug8pLTE
X-Google-Smtp-Source: AGHT+IFobBmG7YAGfACyRH7Ssw9Gb7Sv4fn1+LqNqqfExpktFSaUo9iwm5W5EWyeaQHGa9GtupBKJQ==
X-Received: by 2002:a17:90a:a588:b0:29b:b0c1:60cd with SMTP id b8-20020a17090aa58800b0029bb0c160cdmr12893961pjq.23.1710848164037;
        Tue, 19 Mar 2024 04:36:04 -0700 (PDT)
Received: from localhost.lan ([195.180.150.202])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090ac24500b0029df6fbfd02sm7896802pjx.12.2024.03.19.04.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 04:36:03 -0700 (PDT)
From: Weiji Wang <nebclllo0444@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org
Subject: [PATCH] docs: zswap: fix shell command format
Date: Tue, 19 Mar 2024 19:35:14 +0800
Message-ID: <20240319113518.2387-1-nebclllo0444@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87le6e8xrl.fsf@meer.lwn.net>
References: <87le6e8xrl.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> The *idea* of the change is fine, but there are a couple of problems
> here.  I can't take a patch without a signed-off-by line, so you'll need
> to resubmit with that.

I will resubmit after correcting the format later. Sorry for any
inconvenience.

> Why three colons?  "as follows::" will do what you want.

I see. I will also edit that.
