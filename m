Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5CE58AD6
	for <linux-doc@vger.kernel.org>; Tue,  2 Apr 2024 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051547; cv=none; b=urA5X+kU1vcg5kFDjFqwygo4h10WXpH6Y1a/t7/5pGBz/Fixa8qBngdt+B0bpomcZIUqo3SIsGlQpKC4gICjyw3SuhDN/NyI99Dmcnc6Mxar8dRboOq+5MeLd5E310o29fQ818EU+c2a4GucPGVeyGBDsG6D2zdcDvB8kOFI61g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051547; c=relaxed/simple;
	bh=bWtclbWQ3n4Y/lHPPnDws80AG6Kx8b+JA2wbGmJqKLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQPTNJnd2SURlWzDeQcTp/QiGxkBGVvgH7F5PZKyFDQ5fwu0DREBYMpBlYb5r2czobPx+mrGkeyg93xv5uXHgQiS64sljtMmrKFtLtP4rtZF9iF7QSTDZC77d7O5prbMYlKg1TeUhPTccKPuv+Hzx88BhxBHbh2gwYD5zzDmC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=emt2sI61; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="emt2sI61"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-42ee0c326e8so932001cf.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Apr 2024 02:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712051544; x=1712656344; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WEX73cwwZrQ/BwJdhWVvfWhSUyNTeLuyTP3JLeqfiAw=;
        b=emt2sI61SknS3BQuwNdzzw8d17XUWeKcXEf/DlQAfsa1L3O4h7cfUpyP/4AjfBDDa1
         TlcMBEORQFLobnjlbzxWT4ELapUJwVQJjtpzdQcZHB3Q46zxWy4Az9ugoTGQZhkhfVkK
         fu6q+N8M8Dd+KbY/ZNe36zz6BfcrX54ImraleFzQ0+6sFBZFnNRRKLNN52fMi8QMMsbE
         n4A21EyLLit6H+E2SMuJD8AYDR8r+9K5dMJZZw5BfBwiqYSktrLWA6rXlNwOXeloGmIS
         5rMuDAm7UxKP2C0Wmzup7+Uo3sU7m4iY2dkiK8BrQZeppS2AaI32+KhqnmWiG/WhZ2LP
         TmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051544; x=1712656344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEX73cwwZrQ/BwJdhWVvfWhSUyNTeLuyTP3JLeqfiAw=;
        b=Ww7quRYWm8Qu4pS/ECMVNNQfmo70eoFaXuGWQRQTVI3ySdMUrSlLjvQ+xYRPucxCSP
         eBlT5GF+pmPm7KsXc++G67QPJOvjySNq5cAFX9a1JAanO4EKJAKdJGEgbVOTcp7Lcqua
         MQvhVHE/ml2B6yrP6O1+HYsfSUPcLEq5WwlOLhqmZX1G+qh6NmYDKSMkgK9l1boHo8PO
         txDIV/v1Fi3SdIz3xrgG+vkRC90u4Lhih/mA02295rY3wuBWf6Z8Sfbs6jpChBe9Tlrk
         uzpe8PFjUB7rICRs4jCJp8NN5i7OwtpVqBBtQYy4k5wzOqVw4OZQvQyi2kRt+fKmQGd1
         ZuHg==
X-Forwarded-Encrypted: i=1; AJvYcCWTNVRcUAcf2gtqJCtlC8JsrPcK3tnBIiIIJK2NnHNWBE1iHxnMJKlldqgG4IVFvT1WsJg1IPZTuh+pJSP0hv21S2NWJfZ4RH1G
X-Gm-Message-State: AOJu0YyML1PxlvdKAPhPXxOiME+cuULZTqUB1Boz+zau6DgR2/1WdyzE
	BXi8/YfWL3ObwglPn9FYzU59Z1+EYxCogRwVVMPR6q9voWscNxofqO12PPnElSNIq031YdwXv8B
	ZJGWKPbP7zpQmam4D3VfrGGL6uRETpHRGHnaX
X-Google-Smtp-Source: AGHT+IEoARSTG+8sB5mICzAnb2Podt2MnjgilxHofQTtmG4r4ftr5RqNKjsIYIGWH8oZkaWdS5FoBK0VUhKILjW99KU=
X-Received: by 2002:a05:622a:6188:b0:431:5dd4:a67e with SMTP id
 hh8-20020a05622a618800b004315dd4a67emr801320qtb.14.1712051543372; Tue, 02 Apr
 2024 02:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328142004.2144568-1-jackmanb@google.com> <CAGS_qxr_vdix2mnoZve+L4EZv4wO-XdnJ1burnn7fM-at6EuEg@mail.gmail.com>
In-Reply-To: <CAGS_qxr_vdix2mnoZve+L4EZv4wO-XdnJ1burnn7fM-at6EuEg@mail.gmail.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Tue, 2 Apr 2024 11:52:10 +0200
Message-ID: <CA+i-1C2J1K4ruhunwVjCctbp1n40jdRcc1dHshbw=HB+8nKYxg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Clarify test filter format
To: Daniel Latypov <dlatypov@google.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Higgins <brendan.higgins@linux.dev>, davidgow@google.com, rmoar@google.com, 
	corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 19:27, Daniel Latypov <dlatypov@google.com> wrote:
> This current wording and examples (before and after this change) might
> make the user think otherwise, i.e. that it works like
>   effective_name = suite_name + '.' + test_name
>   return glob_matches(effective_name, filter_glob)
>
> E.g. given a test name like `suite.test_name` and glob='suite*name'
> they might expect it to match, but it does *not*.
>
> The logic actually works like:
>   suite_glob, test_glob = split(filter_glob)
>   if not_glob_matches(suite_name, suite_glob):
>      return False
>   if test_glob and not glob_matches(test_name, test_glob):
>      return False
>   return True
>
> Perhaps expanding the list of examples to cover more of the edge cases
> could help get the right intuition?
>
> E.g. perhaps these:
>   kunit.py run <suite_name>  # runs all tests in a specific suite
>   kunit.py run <suite_name>.<test_name>  # run a specific test
>
>   kunit.py run suite_prefix*  # what the current example shows
>   kunit.py run *.*test_suffix  # matches all suites, only tests w/ a
> certain suffix
>   kunit.py run suite_prefix*.*test_suffix # combined version of above
>
> Thoughts?

Thanks yeah, good point. The result is pretty verbose but it doesn't
create much cognitive load for the reader so might as well just be
really explicit. v2 incoming if `make htmldocs` ever finishes....
