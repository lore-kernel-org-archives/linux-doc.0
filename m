Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E566366075
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 05:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784352633; cv=pass; b=U0jpZG4OnnkGQHNAMHEA2JhWgqnOQlR8oOTmm1osb5in0FxoFy2bj4D4SBvy0olpOlGtApF37XIk3/zgheBz0Jd3gWYaGE1d6KiLfLF724smVW9VFdsXtR0RxPf1PCFeUbpH39m0GCrPf0eB7S0T6iC6y60ResRxSMUdSBHG+rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784352633; c=relaxed/simple;
	bh=St5k3xj4AeRhAT3qhfUkT73XJDbiQlQOZPv5JEO7Dv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBx7TDt6Y5Jec8C/EuCPKHbu0KEvDHtAkXeF/AjXq9RlwS/LIdiAcVHB2rQa352w4pTwEHoFKyP2N2kNE1aN9+R01nnqR5bZBzSoVrTHQig8G3pmrEOUe1on03ms9E/mgy38rfTejUptS5eAknpImCCZrE308HfIx3pSTQA3g5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLSNAWpG; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLSNAWpG"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15c7d22070so1115472866b.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 22:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784352630; cv=none;
        d=google.com; s=arc-20260327;
        b=TaXDNNwFfmIEa5w9ZT7rU44XtNM/a2eXSujI18llGInPkc4CckmNWoHwzM43HVdvJx
         v8k1bwsB8vTGsiv608OfWNu290tjX02adAmNkz1F2mSqXuS2REgDgPwjDZeWZTutrKOt
         BZf8DC2sxP96lt2pe80k3PE/AqmEEnoQfjx30X/4dCB7gqGuEcecKVJX5QFwOu8EBN8b
         vFQMcixBHlSfmi//ZAodgf16qC573eRXCXE7z+3CGO05IvzHyW1yLKYiBJiYExiO1lOR
         0ip6/GgxaYLnfw8wR71bH9s8IPVJu/DgtkBmxRCct28SHV/bDsBQrTFiH49L1r5eMB/m
         QtFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=St5k3xj4AeRhAT3qhfUkT73XJDbiQlQOZPv5JEO7Dv0=;
        fh=+RgepF6CiwxkcEC/bALrYeYhJBtkj3qFUuHO4gY0UhI=;
        b=l6SBKTgvKc3xVSIdxcsyFbPw0TU1kCKJgnhbjxgB1UT5nleX3c9dFtqQYluJdl5J27
         2uXD3ITHJnEZjhQRuQ1c3kjRz8HN5oHb+vqdkoRNBhBhyoykDvYTfAHiIdBbDCtRE/ie
         YAbYM6H9cME/2cdCcx0SOOOuIC5EnHu9NJ43CMwvWUwbcCLwnh7AeUx5DLIuN8vRK9JK
         HxjXOPoI+VSWs6Wk9ibg+tnloTzUnDNoSvI0j1XwR4j/ggsqvuRGCVgpAs7LYACvS+0R
         6uh9GrrBkxH5dzecLdFVTOJTkFoZHaWA0dbaaCXaYspc2zJWQx4HrC4B4PMARSPrfNt9
         XKUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784352630; x=1784957430; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=St5k3xj4AeRhAT3qhfUkT73XJDbiQlQOZPv5JEO7Dv0=;
        b=dLSNAWpGn+AYA3Ja8ZBDg6U+/i+xfqMpH34m6m9kjklwRkNUmUsWx7D2/3kytFqpzw
         zqPPKFBg5mIHGSsXuoJEOLtZyOoz6XGBVzpy+w+GzXF7z0DzLgmLlEZFpAowngvaT1Zz
         OYmnhQx59SbVcbXiMBdUrGUE5fQQoMbf7/QxWKN9ToMrhf6jyJ5PAodODi6bMUtleX67
         gZXl2DIJNcd6TvPEpiUJdnXnrD8HdlwOA8t0cTkYCUYxrJGIizZW3v50+qKGFAUaz7cL
         60csjiweZU7cT+VPlBySAHD8zok8+kUydSXTTAShOkK0sY2QWt8zjjaJXsAasFOUxgxg
         nr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784352630; x=1784957430;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=St5k3xj4AeRhAT3qhfUkT73XJDbiQlQOZPv5JEO7Dv0=;
        b=Fd8xBETpcG1KpeBZnUeLhv48losK4n1SCofY1oZkwf0ax0mbVA7Pcmbg53hnmPKYe7
         5AAM8mIJ0lYTZ3zxuWuObRkbUrUy6HZ7DJVKVIYYq6gCo5aohSKkE8RahyJ+aA0Dp6RZ
         2uZJ+QeDnardRfU4KTtT652lJM2W5mpW1DZ20IziYar/ZZHOAhYUoA/Uoyet+rGhVElh
         wiPy4gjIuCnLth5mKzKsdjHIe0FiIQd6NIB5oRInAalU/CKn9MaSnN9Ev5paGSm+Hywz
         xVdUVwdnhdk0r6qtaMy+8sxrSB8dmcDbYlKn29Mc5dc53tJSr+ojMoqt6aqfCJ6lzKWg
         CjMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmSLrTW2eDAcywi053GRdgJt6UHtbg+NN+s7p932f2cXlHf7+kFeEgwPmAGTf5CYBiZ0ecC3K7Igc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAO0PyJxMEV3IbjEHHzkoBKK92uqFsiPeqObQVdhCp6kRS3EmC
	3Rye6J2z7t5rdZi+un92iHnBfcnubJmQxDZdfk+Vt9VSFGcOd0rJv2+grSLCmKsT+VMmfHj+Dri
	sgUf7dLP734VR5GSsvCgs9DyX2tziudjUaGC2Oog=
X-Gm-Gg: AfdE7cntDK1n+46tM3ZSjeOWMQfWZJq3reEcXJWJhmDac/Ad7KXkiSCQyq3TcX1nHSF
	QRPZ0NFP/hgG00alWyf+loRu5lHd2FTws+aJT2PQ4OFccaiSg8zUBKXoZLthg1q6i+jBUUdGngZ
	1tN/nJYvhGoUusIUW4e5HmrvvuvkMaQjkBhmVqlupMxMjQGoRn8TYlfZxIKAbZGE2lpDwK1D1/N
	yQ+OW5IZUxemvfGJPbh5OEhtcjW+ikhWgsplNS60Qp83sTxWwo1Vzd/3h8dKEi+vKDtNz8j7+aQ
	sWQK+5KYPfIamXgF4E6xQU+V2foqyO4GXx21sfEFo9VIbjY=
X-Received: by 2002:a17:907:e1d3:10b0:c12:34ed:da14 with SMTP id
 a640c23a62f3a-c16b47ea252mr147632766b.64.1784352630205; Fri, 17 Jul 2026
 22:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
In-Reply-To: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sat, 18 Jul 2026 11:00:19 +0530
X-Gm-Features: AUfX_mxhIJFm-FhL7GTanL1EAGlmqlbs9olf-RM3hy7jEr95fa0uEkWsyyRhdQw
Message-ID: <CAFgddhJpqOO+pBrVs6U=mMOfXrO1DPTZ6XAbwPQubjYz4ZB35A@mail.gmail.com>
Subject: Re: [PATCH 0/2] usbcore: Add quirk for 255-byte initial config read
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	stern@rowland.harvard.edu, michal.pecio@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sorry, forgot to mark this as v3. This should be [PATCH v3 0/2].

Changes from v2:
- put strings in a single line
- copy bytes from desc to bigbuffer instead of pointer aliasing.
- change tabs to spaces in documentation
- reworded some comments
- drop USB_CONFIG_WINDOWS_REQ_SIZE macro
- revert USB_DELAY_INIT to original behavior. no delay before 1st request.
- split announce_device() so we can report device ids early before
vendor strings

Thanks,
Nikhil Solanke
