Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D02421886;
	Thu, 26 Mar 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774544437; cv=pass; b=kWS4i2/YdR6fbVEq/kkGtO8TqFz2GvxAML+9d6a/Qsc/STZUro8tbN+29vw2LePBYVWwODDEzDV45QU5bGdUbYAXgcqSlfQ57dS71DssvIOqn6rD3Lsz3Bzu4RPwxyINLE5Y61txI//3xSYE+Di4w3G8bVm8p/tghpjXx0iN/Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774544437; c=relaxed/simple;
	bh=QZjo8HWzUfwgvYueznW0n3l/KDYV+6fhsd+uDKs861E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=ppCe/feg3VugH9w6q/prFIAaSSehySE11ViacWdfGur8XIQvAaCZmi4Eg/ETTlAglsB4pXgPz7OW04n+Y+ADyAmHACa/2qXHnGV21EC+oy5U2s+qWuQt8njF9GN04uWcWSGJ2M+Qe6NiGCs7rhjA/4pCxu6539DGxWdWwuxt79U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=iff09bLG; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="iff09bLG"
ARC-Seal: i=1; a=rsa-sha256; t=1774544423; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AmhNdUtRvEi4VrLDuaEnygT/xo4zFO5ZeE5iCBAiaw+d6bUD87wFqyWN5cAvw1UibFtUz/av5L16S9aykh4J622fEeD8xNASlLLRNbsJGxDTEwub8xZ/o4O4TWRc/ET/88wEt8B8qR7Hk7EbzsUzGe9Oy3CDsQbECupUhnVVH1k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774544423; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9yuIDVbZHrmfv+OrF6229B+oMFmyZWA4UL/B68TqFC0=; 
	b=TC28W6A9wFYc5sfeNywuFdBBMUKPiIyZxv+SjECAjfh5DftIXXdxxFZz0jeTqFA7124IzLFmsJ7htBK9VW6HDFGWssyoW7WtdmikTJoRgQcOJr3dhcLa1qZDLQnr6e2vDOb4Tholmq1z6qczrilP0ioYjKesft5V1TKpMEinYzc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774544423;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=9yuIDVbZHrmfv+OrF6229B+oMFmyZWA4UL/B68TqFC0=;
	b=iff09bLGFxeUDuZO05dtxIM6wMdm8PXnMrC1KwtIsMLKGceVNLL7Be7a/xLWcRq5
	MTioU4ppw2vfhDRxRf241zVx6wmNMRJTxvr9eHdZg32mjqAvzzSMelciRs1EgBufOfc
	4PJvYN5zRm63iFIT8QJj0lpo/6mzAj3XH9kgtYnE=
Received: by mx.zohomail.com with SMTPS id 1774544421815353.293292512418;
	Thu, 26 Mar 2026 10:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 13:00:19 -0400
Message-Id: <DHCVHVXD0SCR.S4H4JOLN7KEV@ritovision.com>
Subject: Re: [PATCH v3] docs: allow long unbroken headings to wrap and
 prevent overflow
Cc: "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321144855.30429-1-rito@ritovision.com>
 <20260323153024.32317-1-rito@ritovision.com>
 <87h5q3g288.fsf@trenco.lwn.net> <DHC6NJM3JZJC.3EIT3YD7O8CDW@ritovision.com>
 <87fr5nefat.fsf@trenco.lwn.net>
In-Reply-To: <87fr5nefat.fsf@trenco.lwn.net>
X-ZohoMailClient: External

I tested the issues in the following environments:

Windows 10 desktop:
- Chrome
- Firefox
- Edge

Kali Linux under WSL2:
- Chromium
- Firefox

Android 16 mobile:
- Chrome
- Firefox
- Edge

I put together a screenshot catalog of my test results in each
environment, the images are hosted in a GitHub issue and referenced
here. Note that on mobile, when horizontal scroll overflow occurred,
I zoomed out to show the full page width exceeding the header width
to demonstrate the broken layout it caused.

The two cases I used were:

Long slash-delimited string:
https://docs.kernel.org/6.15/userspace-api/sysfs-platform_profile.html

Long underscore-delimited string:
https://docs.kernel.org/6.15/userspace-api/gpio/gpio-v2-line-get-values-ioc=
tl.html

Results by environment:

Windows 10

Chrome:
- slashes: horizontal overflow
  https://github.com/user-attachments/assets/2189783c-0328-4079-a1f0-8aead0=
3e4041
- underscores: horizontal overflow
  https://github.com/user-attachments/assets/d351eb45-44bb-4ae3-8e2c-055a92=
9c776b

Firefox:
- slashes: wraps normally
  https://github.com/user-attachments/assets/fe6667d2-1559-4a50-a1e8-feada0=
dadd3b
- underscores: horizontal overflow
  https://github.com/user-attachments/assets/b7ee8a66-0c41-457d-b699-9b825f=
b8b5a1

Edge:
- slashes: horizontal overflow
  https://github.com/user-attachments/assets/703c4e0a-ad0c-42a1-bda6-356a2b=
c9c609
- underscores: horizontal overflow
  https://github.com/user-attachments/assets/08fa2762-22c4-48b7-aaa4-d418bc=
c83b62

Kali Linux under WSL2

Chromium:
- slashes: horizontal overflow
  https://github.com/user-attachments/assets/5a25a590-fb84-4445-9bb0-baf069=
498e41
- underscores: horizontal overflow
  https://github.com/user-attachments/assets/dfa38ba2-2c2b-49af-bd39-318521=
57e82f

Firefox:
- slashes: wraps normally
  https://github.com/user-attachments/assets/cd736918-4f48-48fe-b18d-822dd2=
e6727b
- underscores: horizontal overflow
  https://github.com/user-attachments/assets/6ff9e12f-f0b6-445b-a372-aebc93=
e4a951

Android 16 mobile

Chrome:
- slashes: horizontal overflow
  https://github.com/user-attachments/assets/ea05ef9f-b7ba-4d18-8828-fd3ec7=
a3db49
- underscores: horizontal overflow
  https://github.com/user-attachments/assets/a4d088ee-d385-499d-bc05-03b8e1=
9870ef

Firefox:
- slashes: wraps normally
  https://github.com/user-attachments/assets/84018ee9-8c87-4d00-99dc-c4569b=
d16e2c
- underscores: horizontal overflow
  https://github.com/user-attachments/assets/c694acae-18d7-48a1-abcd-a2ae20=
8cfa73

Edge:
- slashes: horizontal overflow
  https://github.com/user-attachments/assets/c5f110f8-3ee8-4490-89f4-d8da33=
e4f37d
- underscores: horizontal overflow
  https://github.com/user-attachments/assets/4486cb0a-53c1-4d5f-bcc6-d61680=
133a2c

So the pattern I saw was:

- Long slash-delimited strings wrapped normally only in Firefox, on
  all three environments I tested. In every other browser/environment,
  they caused page-wide horizontal scroll overflow.
- Long underscore-delimited strings caused page-wide horizontal
  scroll overflow in every browser/environment I tested.

If it is easier to review the screenshots in one place,
I collected them in this GitHub issue with environment
headings:

https://github.com/ritovision/linux-kernel-docs/issues/2

That issue may also be a convenient place to add your own
screenshots to host and reference here for comparison.

Rito
