Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D52E33DEE5
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771584241; cv=none; b=TE0tfMgECdRX2gYqx9CzBYPBgTWN5VnkE9GN2+iyCyNHCTh11QkX6A8Qg14NO+ZmDJmgXOH0xsYwwDznRcfeU8i4wrLFYdgw76u49T8KdBzgRbRCald0yFccydqR1csZ8jiriX58Z+TNmFg6WkeizK6UMbJOAKMWBPn072QYt/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771584241; c=relaxed/simple;
	bh=6oat1xU8anNE+fKnMu7RuV5yY2BMoQVNebDQXBXTHyo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XW9TeAhUT/Hlbd3VvSRlFuro+SydlVTuB+1ahI1OKZc6nuYBnBqBO5qituFCsg5ZfvMyhkpQgUayZlun/JMd2WJdOoOCYGAMruXRfp247dofpKAmF0CK67Kl1HJsPrrHcOyFXKU1fTos+a2ap+1GRm9N54XsVdXMqdEdBHcxslQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zx7VlbDB; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zx7VlbDB"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8f9734e619so142174666b.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 02:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771584238; x=1772189038; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=159VoEA5XmeLqnnj1kbXT6hpp/0sD1qh3nTegzxwn4M=;
        b=Zx7VlbDBH1k04UAoGS92zbRtSEp0U+Kl7E0rx79M8A3M+MGPRdQwRYKTAWDB3V0hBK
         RRBQ39m2UWtqjSKIEfo06UZ+o/6N+Jy2aZ1w9d4TEgNmRDlFGqs5SZ371tD3MMGVmofd
         NCWOfrfsL8peSZ2qgx9o2z0qHHlc7ejygNop5WAVOnhI9j0s3nCbhZnd1gpxHNkjpQSi
         +BpJSgXlYZeZsAgzeBWbh1f9yV/Y0rXDUmIyEVOEpJGn8TxOdpMKnK8AV0cLxVncoi1e
         hBIPD08fSz6/smyWNEqFlzMUfYqwHVmDSC3W0q0gRJCW8SU3OGZ23vOoWzqnS8ABQ11k
         yrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771584238; x=1772189038;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=159VoEA5XmeLqnnj1kbXT6hpp/0sD1qh3nTegzxwn4M=;
        b=DO5Vo7iR3sT+5PgpLkpLmYVjZCxyHCg4ec1m9IxaTMBy61tago8qz2J3A3Klds++UZ
         5lBYesvXbZS3ivxRs1IijlWV1UNvrJ+mqt9yMmKy5aGkdosZMW/MdZvsIjO6qEcq9wtA
         LE0xLp7DWiQqPevFanYVjYMiUSEFCh36dGFJMvvXELb45gLahYJu6SVsnCD7G3mViLnV
         15cvBN8wAgKgJV4DaWe+DBaKM5ZBoWlQH6xOAVQ6BQWuvrQhqtYu38XvjPhxTGfm3W6m
         vHAjFqPpRAaPGlvARUVYFH5fad3yZ62vXSRPRcWDB23glSmzLLihhwGBOjF45RxhllfH
         5VsA==
X-Forwarded-Encrypted: i=1; AJvYcCW2du/eqai9RecYgUHrmyvLY7RDHyl9mMZkOQOG4a35C6eVvhH6AI/atPerIaIWSlEQYqtYREu0Jsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGX7/7NTnky7AjIX3+dNw4hHpr4h65HrodD7buDO/f/X9QZDk9
	9XNG2BQTCdhWRLaFP15ufaNSDJ6xu8LpfJcEIif3ui43UsXrGktmWVMnpCG1IW+GSXiK4Dbo0Ig
	yKzTfImwLdiPQ9XihGg==
X-Received: from ejcxl37.prod.google.com ([2002:a17:907:d865:b0:b8f:9da9:5701])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:f586:b0:b87:daee:a6c4 with SMTP id a640c23a62f3a-b903dc9993cmr479899666b.36.1771584237418;
 Fri, 20 Feb 2026 02:43:57 -0800 (PST)
Date: Fri, 20 Feb 2026 10:43:56 +0000
In-Reply-To: <20260219-remove-task-euid-v1-1-904060826e07@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260219-remove-task-euid-v1-1-904060826e07@google.com>
Message-ID: <aZg67K1Il3Dq3-Ap@google.com>
Subject: Re: [PATCH] task: delete task_euid()
From: Alice Ryhl <aliceryhl@google.com>
To: Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-security-module@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 19, 2026 at 12:14:39PM +0000, Alice Ryhl wrote:
>  include/linux/cred.h                                      |  1 -

I guess the title of this should probably be

	cred: delete task_euid()

rather than use the 'task:' prefix.

Alice
